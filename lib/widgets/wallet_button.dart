import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/api/wallet_connector.dart';

class WalletButton extends HookConsumerWidget {
  const WalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connector = useMemoized(createConnector);

    return ElevatedButton(
      onPressed: () => connectToMetamask(connector),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Walletを見る',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
