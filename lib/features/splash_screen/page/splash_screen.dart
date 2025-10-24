import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SplashBody(),
    );
  }
  
}

class _SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('SplashScreen');
  }
}