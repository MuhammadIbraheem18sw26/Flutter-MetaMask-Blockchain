import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operationChain = 4;

  String currentAddress = "";

  int currentChain = -1;

  bool get isEnabled => ethereum != null;

  bool get isOperatingChain => currentChain == operationChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future<void> connect() async {
    if (isEnabled) {
      final account = await ethereum!.requestAccount();
      if (account.isNotEmpty) currentAddress = account.first;

      currentChain = await ethereum!.getChainId();
      notifyListeners();
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
  }

  init() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        clear();
      });
      ethereum!.onChainChanged((chainId) {
        clear();
      });
    }
  }
}
