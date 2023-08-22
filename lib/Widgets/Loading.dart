import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              backgroundBlendMode: BlendMode.color
          ),
          child: const Center(
            child: SpinKitWaveSpinner(
              color: Colors.purpleAccent,
              size: 50,
            ),
          )
      ),
    );
  }
}