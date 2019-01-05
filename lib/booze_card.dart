import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'models/cocktail.dart';

class BoozeCard extends StatelessWidget {
  final Color color;

  const BoozeCard({
    Key key,
    @required this.color,
  })  : assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Cocktail>(
        future: fetchCocktail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(snapshot.data.name),
              Text(snapshot.data.glass),
              Text(snapshot.data.instructions)
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
