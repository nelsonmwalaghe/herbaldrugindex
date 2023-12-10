import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _imageIdx = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) =>
    setState((){
      _imageIdx = Random().nextInt(Config.splashScreenImageList.length);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Config{
  static List<String> splashScreenImageList = [
    "assets/herb1.jpg",
    "assets/herb2.jpg",
    "assets/herb3.jpg",
    "assets/herb4.jpg",
    "assets/herb5.jpg",
    "assets/herb6.jpg",
    "assets/herb7.jpg",
    "assets/herb8.jpg",
    "assets/herb9.jpg",
    "assets/herb10.jpg",
    "assets/herb11.jpg",
    "assets/herb12.jpg",
    "assets/herb13.jpg",
    "assets/herb14.jpg",
    "assets/herb15.jpg",
    "assets/herb16.jpg",
    "assets/herb17.jpg",
  ];
}