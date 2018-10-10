import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'models/horoscope.dart';

class HoroscopeCardText extends StatelessWidget {
  final String name;
  final String value;

  const HoroscopeCardText({
    Key key,
    @required this.name,
    @required this.value
  })  : assert(name != null),
        assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row (
        children: <Widget>[
          Expanded(
            child: Text(
              "$name ",
              textAlign: TextAlign.left,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  height: 2.0
              ),
            )
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: new TextStyle(
                  fontSize: 20.0,
                  height: 2.0
              )
            )
          )
        ]
      )
    );
  }
}

class HoroscopeCard extends StatelessWidget {
  final String sign;
  final Color color;
  final String icon;

  const HoroscopeCard({
    Key key,
    @required this.sign,
    @required this.color,
    @required this.icon,
  })  : assert(sign != null),
        assert(color != null),
        assert(icon != null),
        super(key: key);

  @override
  Widget build (BuildContext context) {
    return FutureBuilder<Horoscope>(
      future: fetchHoroscope(sign),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                    icon,
                    height: 40.0,
                    color: color,
                ),
              ),
              Text(
                snapshot.data.description,
                style: Theme.of(context).textTheme.headline
              ),
              HoroscopeCardText(
                name: 'Color',
                value: snapshot.data.color
              ),
              HoroscopeCardText(
                name: 'Mood',
                value: snapshot.data.mood
              ),
              HoroscopeCardText(
                name: 'Compatibility',
                value: snapshot.data.compatibility
              ),

            ]
          );
        } else if (snapshot.hasError) {
          return new Text(snapshot.error);
        }
        return Container(
          width: 20.0,
          height: 40.0,
          alignment: Alignment.center,
          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(color))
        );
      }
    );
  }
}