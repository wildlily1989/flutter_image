import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Images',
      home: CacheImage(title: 'cache Image',),
//        home: FadeImage(title: 'Fade In Image',),
//      home: WebImage(title: 'Web Image'),
    );
  }
}

class WebImage extends StatelessWidget {
  final title;
  WebImage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
          child: new Image.network(
            'http://img.16pic.com/00/86/85/16pic_8685054_s.jpg'
          ),
        ));
    throw UnimplementedError();
  }
}

class FadeImage extends StatelessWidget{
  final title;
  FadeImage({Key key,this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fade In Image'),
      ),
      body: new Stack(
        children: <Widget>[
          new Center(child: new CircularProgressIndicator()),
          new Center(
            child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'http://img.16pic.com/00/86/85/16pic_8685054_s.jpg'),
          )
        ],
      ),
    );

    throw UnimplementedError();
  }
}

class CacheImage extends StatelessWidget{
  final title;
  CacheImage({Key key,this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new CachedNetworkImage(
          imageUrl: 'http://img.16pic.com/00/86/85/16pic_8685054_s.jpg',
          placeholder:(context,imageUrl)=> new CircularProgressIndicator(),
        ),
      ),
    );

    throw UnimplementedError();
  }
}