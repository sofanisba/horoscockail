import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class BoozeCard extends StatelessWidget {
//  final String sign;
  final Color color;
//  final String icon;

  const BoozeCard({
    Key key,
//    @required this.sign,
    @required this.color,
//    @required this.icon,
  })  : assert(color != null),
        super(key: key);
//        assert(icon != null),


  @override
  Widget build (BuildContext context) {
    return Image.asset(
      'assets/wine.png',
      height: 70.0,
      color: Colors.black,
    );
  }
}