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

  Widget _grid() {
    return SliverPadding(
      padding: EdgeInsets.all(7),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            var image = getRandomImage();
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeroPage(index, image),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Hero(
                    tag: index,
                    child: CachedNetworkImage(
                      imageUrl: image,
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: 90,
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.deepPurpleAccent.withOpacity(.7),
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("21 May 2019"),
        background: Stack(
          children: <Widget>[
            Positioned.fill(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: getRandomImage(isBig: true),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.deepPurpleAccent],
                    stops: [0, 100],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(),
          _grid(),
        ],
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  final int tag;
  final String url;

  HeroPage(this.tag, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(.7),
      ),
      body: Hero(
        tag: this.tag,
        child: Center(
          child: Container(
            width: double.infinity,
            child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: this.url),
          ),
        ),
      ),
    );
  }
}
