import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WowPage extends StatelessWidget {
  const WowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Lottie.asset("assets/animations/food.json",fit: BoxFit.cover,height: 300.0),
          Lottie.asset("assets/animations/bird.json",fit: BoxFit.cover,height: 300.0),
        ],
      )),
    );
  }
}