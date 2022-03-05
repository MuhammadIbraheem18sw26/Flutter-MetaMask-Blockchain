import 'package:dapp/metamaskProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MetaMaskProvider()..init(),
      builder: (context, child) {
        return Scaffold(
          appBar:
              AppBar(title: Text("Dapp"), backgroundColor: Colors.amberAccent),
          backgroundColor: const Color(0xEED28B0F),
          body: Stack(
            children: [
              Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late final String text;

                    if (provider.isConnected && provider.isOperatingChain) {
                      text = 'Connected';
                    } else if (provider.isConnected &&
                        !provider.isOperatingChain) {
                      text =
                          'Wrong chain. Please connect to ${MetaMaskProvider.operationChain}';
                    } else if (provider.isEnabled) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
                          CupertinoButton(
                            onPressed: () =>
                                context.read<MetaMaskProvider>().connect(),
                            color: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                  width: 300,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      text = 'Please use a Web3 supported browser.';
                    }

                    return ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.red],
                      ).createShader(bounds),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTicLAkhCzpJeu9OV-4GOO-BOon5aPGsj_wy9ETkR4g-BdAc8U2-TooYoiMcPcmcT48H7Y&usqp=CAU',
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.025),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// return ChangeNotifierProvider(
//     create: (BuildContext context) => MetaMaskProvider()..init(),
//     builder: (context, child) {
//       return SafeArea(
//           child: Scaffold(
//         appBar: AppBar(title: Text("Dapp")),
//         body: Center(
//           child: Consumer<MetaMaskProvider>(
//               builder: (context, provider, child) {
//             late final String text;
//             if (provider.isConnected && provider.isOperatingChain) {
//               text = "is Connected";
//             }
//             return Container(
//               padding: EdgeInsets.all(20),
//               constraints: BoxConstraints.expand(height: 300, width: 400),
//               decoration: const BoxDecoration(
//                 color: Colors.black45,
//                 borderRadius: BorderRadius.all(Radius.circular(14)),
//               ),
//               child: TextButton(
//                 child: Text("Press to connect to meta mask"),
//                 onPressed: () {
//                   print("isPressed");
//                 },
//               ),
//             );
//           }),
//         ),
//       ));
//     });
