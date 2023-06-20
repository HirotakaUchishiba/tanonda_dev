import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'logger.dart';
import 'navigation.dart';
import 'routing/app_router.dart';

const fcmPayloadLocationKey = 'location';

final firebaseMessagingProvider =
    Provider<FirebaseMessaging>((_) => throw UnimplementedError());

Future<FirebaseMessaging> get getFirebaseMessagingInstance async {
  final messaging = FirebaseMessaging.instance;
  if (Platform.isIOS) {
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  return messaging;
}

final initializeFirebaseMessagingProvider =
    Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    await ref.read(firebaseMessagingProvider).requestPermission();
    await ref.read(_initializeLocalNotificationProvider)();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await ref.read(_getInitialMessageProvider)();
    ref.read(_onMessageProvider)();
    ref.read(_onMessageOpenedAppProvider)();
  },
);

final getFcmTokenProvider = Provider.autoDispose<Future<String?> Function()>(
  (ref) => () => ref.read(firebaseMessagingProvider).getToken(),
);

final _getInitialMessageProvider =
    Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      logger.info('🔥 Open app from FCM when terminated.');
      final data = remoteMessage.data;
      await ref.read(_handleNotificationDataProvider)(data);
    }
  },
);

final _onMessageStreamProvider = StreamProvider<RemoteMessage>(
  (ref) => FirebaseMessaging.onMessage,
);

final _onMessageProvider = Provider(
  (ref) => () => ref.listen<AsyncValue<RemoteMessage>>(
        _onMessageStreamProvider,
        (previous, next) async {
          final remoteMessage = next.value;
          final androidNotification = remoteMessage?.notification?.android;
          if (remoteMessage == null || androidNotification == null) {
            return;
          }
          await _showLocalNotification(remoteMessage);
        },
      ),
);

Future<void> _showLocalNotification(RemoteMessage remoteMessage) async {
  final remoteNotification = remoteMessage.notification;
  if (remoteNotification == null) {
    return;
  }
  final title = remoteNotification.title ?? 'SPAJAM 2022';
  final body = remoteNotification.body ?? '新着通知があります。';
  await flutterLocalNotificationsPlugin.show(
    remoteNotification.hashCode,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,
        channelDescription: androidNotificationChannel.description,
        importance: androidNotificationChannel.importance,
        priority: Priority.max,
        ticker: 'ticker',
        visibility: NotificationVisibility.public,
      ),
    ),
    payload: json.encode(remoteMessage.data),
  );
}

final _onMessageOpenedAppStreamProvider = StreamProvider<RemoteMessage>(
  (ref) => FirebaseMessaging.onMessageOpenedApp,
);

final _onMessageOpenedAppProvider = Provider(
  (ref) => () => ref.listen<AsyncValue<RemoteMessage>>(
        _onMessageOpenedAppStreamProvider,
        (previous, next) async {
          final remoteMessage = next.value;
          if (remoteMessage == null) {
            return;
          }
          if (remoteMessage.data.containsKey(fcmPayloadLocationKey)) {
            logger.info('🔥 FCM notification tapped.');
            final data = remoteMessage.data;
            await ref.read(_handleNotificationDataProvider)(data);
          }
        },
      ),
);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage _) async {
  logger.info('Received remote message on background.');

  if (Firebase.apps.isNotEmpty && Platform.isAndroid) {
    return;
  }
  await Firebase.initializeApp();
}

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

const androidNotificationChannel = AndroidNotificationChannel(
  'high_importance_channel',
  'お知らせ',
  description: 'アプリ内からのお知らせを通知します。',
  importance: Importance.max,
);

final _initializeLocalNotificationProvider = Provider.autoDispose(
  (ref) => () async {
    // iOS では何もしない。
    if (Platform.isIOS) {
      return;
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  },
);

final _handleNotificationDataProvider =
    Provider.autoDispose<Future<void> Function(Map<String, dynamic>)>(
  (ref) => (data) async {
    final location = data[fcmPayloadLocationKey] as String;
    logger.info('location: $location, data: $data');
    if (data.containsKey(fcmPayloadLocationKey)) {
      // location: `/` の場合は、すべての画面を取り除く
      if (location == ref.read(appRouterProvider).initialRoute) {
        ref.read(navigationServiceProvider).popUntilFirstRoute();
      } else {
        await ref
            .read(navigationServiceProvider)
            .pushOnCurrentTab(location: location, arguments: data);
      }
    }
  },
);
