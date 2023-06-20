import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

WalletConnect createConnector() {
  return WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'create_to_Metamask_App',
      description: 'アプリの説明文です',
      url: 'https://yamawo.info',
      icons: [
        'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
      ]
    )
  );
}

Future<void> connectToMetamask(WalletConnect connector) async {
  if (!connector.connected) {
    try {
      await connector.createSession(onDisplayUri: (uri) async {
        if (await canLaunch(uri)) {
          await launch(uri);
        } else {
          throw 'Could not launch $uri';
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
