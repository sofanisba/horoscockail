import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'models/horoscope.dart';

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
      color: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(
            'Today\s Horoscope',
            style: Theme.of(context).textTheme.display1,
          ),
          Center(
            child: FutureBuilder<Horoscope>(
              future: fetchHoroscope(name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.description);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }
            ),
          )
        ],
      )
    );
  }
}