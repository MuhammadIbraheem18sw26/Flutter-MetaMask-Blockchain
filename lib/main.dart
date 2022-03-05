import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const Dapp());
}

class Dapp extends StatelessWidget {
  const Dapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DApp',
      theme: ThemeData().copyWith(
        primaryColor: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
