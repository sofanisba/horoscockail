import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'models/wine.dart';

class BoozeCard extends StatelessWidget {
  final Color color;

  const BoozeCard({
    Key key,
    @required this.color,
  })  : assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Wine>(
        future: fetchWine(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/wine.png',
                  height: 70.0,
                  color: color,
                ),
              ),
              Text(snapshot.data.name),
              Text(snapshot.data.tastingNote),
              Text(snapshot.data.varietal)
            ]);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return Container(
              width: 20.0,
              height: 40.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(color)));
        });

//    return Image.asset(
//      'assets/wine2.png',
//      height: 70.0,
//      color: color,
//    );
  }
}
