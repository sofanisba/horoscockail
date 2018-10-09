import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'horoscope_route.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries
final _rowHeight = 80.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Sign extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final String icon;

  const Sign({
    Key key,
    @required this.name,
    @required this.color,
    @required this.icon,
  })  : assert(name != null),
        assert(color != null),
        assert(icon != null),
        super(key: key);

  void _navigateToHoroscope(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: HoroscopeRoute(
            name: name,
            color: color,
            icon: icon
          )
        );
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white30,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          splashColor: color,
          onTap: () => _navigateToHoroscope(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(icon)
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}