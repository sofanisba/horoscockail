import 'package:flutter/material.dart';

class TabledListItem extends StatelessWidget {
  final String name;
  final String value;

  const TabledListItem({
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
