import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'horoscope_card.dart';
import 'booze_card.dart';

class HoroscopeRoute extends StatelessWidget {
  final String name;
  final Color color;
  final String icon;

  const HoroscopeRoute({
    @required this.name,
    @required this.color,
    @required this.icon,
  })  : assert(name != null),
        assert(color != null),
        assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 1.0,
              child: Container(
                padding: new EdgeInsets.all(8.0),
                margin: new EdgeInsets.all(8.0),
                child: HoroscopeCard(sign: name, color: color, icon: icon),
              ),
            ),
            Card(
                elevation: 1.0,
                child: Container(
                    padding: new EdgeInsets.all(8.0),
                    margin: new EdgeInsets.all(8.0),
                    child: BoozeCard(color: color, sign: name))),
          ],
        ));
  }
}
