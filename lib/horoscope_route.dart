import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class HoroscopeRoute extends StatelessWidget {
  final String name;
  final Color color;
  final String icon;

  const HoroscopeRoute({
    @required this.name,
    @required this.color,
    @required this.icon,
  }) : assert(name != null),
       assert(color != null),
       assert(icon != null);

  @override

  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            name,
            style: Theme.of(context).textTheme.headline
          )
        ],
      )
    );
  }
}