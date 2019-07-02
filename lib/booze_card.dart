import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'models/cocktail.dart';
import './tabled_list_item.dart';

getGreeting() {
  final phrases = [
    'After that, looks like you need a drink',
    'Cheers?!?',
    'Time for a',
    'Tempt fate with a'
  ];
  return phrases[new Random().nextInt(phrases.length)];
}

class BoozeCard extends StatelessWidget {
  final Color color;
  final String sign;

  const BoozeCard({
    Key key,
    @required this.color,
    @required this.sign,
  })  : assert(color != null, sign != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Cocktail>(
        future: fetchCocktail(sign),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: <Widget>[
              Text(getGreeting(), style: Theme.of(context).textTheme.subtitle),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(3.0),
                  child: Image.network(
                    snapshot.data.thumbnail,
                    height: 150.0,
                  ),
                ),
              ),
              Text(snapshot.data.name,
                  style: Theme.of(context).textTheme.display1),
              TabledListItem(name: 'Glass', value: snapshot.data.glass),
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
  }
}
