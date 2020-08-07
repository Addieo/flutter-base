import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('container2 学习'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Image.asset('assets/images/owl.jpg', width: 120, height: 120),
              Image.network(
                'https://flutter.io/images/homepage/header-illustration.png',
                width: 120,
                height: 120
              ),
              Image(
                image: NetworkImage('https://flutter.io/images/homepage/header-illustration.png'),
                width:120,
                height:120,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage('https://flutter.io/images/homepage/header-illustration.png'),
                radius: 20,
              )
            ],
          ),
          Row(
            children: <Widget>[
              new FadeInImage.assetNetwork(
                placeholder: 'assets/images/owl.jpg',
                image: 'https://flutter.io/images/homepage/header-illustration.png',
                width: 120,
                height: 120
              ),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://flutter.io/images/homepage/header-illustration.png',
                width: 120,
                height: 120,
              )
            ],
          ),
          new Image.asset(
            'assets/images/owl.jpg',
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}