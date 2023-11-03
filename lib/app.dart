import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanonda_dev/screens/home_screen.dart';

import 'features/auth/auth.dart';
import 'screens/root_navigator.dart';
import 'utils/extensions/build_context.dart';

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
        ref.read(signInAnonymouslyProvider)();
    final isSignedIn = ref.watch(isSignedInProvider).valueOrNull ?? false;
    return MaterialApp(
      key: UniqueKey(),
      title: 'tanonda_dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown).copyWith(
        textTheme: TextTheme(
          displayLarge: context.textTheme.displayLarge!.copyWith(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: context.textTheme.displayMedium!.copyWith(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: context.textTheme.displaySmall!.copyWith(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headlineLarge: context.textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: context.textTheme.headlineMedium!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: context.textTheme.headlineSmall!.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: context.textTheme.titleLarge!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: context.textTheme.titleMedium!.copyWith(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: context.textTheme.titleSmall!.copyWith(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: context.textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontSize: 16,
          ),
          bodyMedium: context.textTheme.bodyMedium!.copyWith(
            color: Colors.black,
            fontSize: 14,
          ),
          bodySmall: context.textTheme.bodySmall!.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
          labelLarge: context.textTheme.labelLarge!.copyWith(
            color: Colors.black,
            fontSize: 16,
          ),
          labelMedium: context.textTheme.labelMedium!.copyWith(
            color: Colors.black,
            fontSize: 14,
          ),
          labelSmall: context.textTheme.labelSmall!.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        cardTheme: const CardTheme(margin: EdgeInsets.zero),
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black12,
        ),
      ),
      home: !isSignedIn ? HomeScreen() : const RootNavigator(),
      builder: (context, child) {
        return MediaQuery(

          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}
