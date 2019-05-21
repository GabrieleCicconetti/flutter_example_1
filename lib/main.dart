import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  /* Get random image from picsum. Thank you ;) */
  String getRandomImage({bool isBig = false}) {
    return "https://picsum.photos/id/${Random().nextInt(50)}/${isBig ? "800/800" : "200/200"}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
