import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'models/horoscope.dart';
import './tabled_list_item.dart';

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
              TabledListItem(
                name: 'Color',
                value: snapshot.data.color
              ),
              TabledListItem(
                name: 'Mood',
                value: snapshot.data.mood
              ),
              TabledListItem(
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
