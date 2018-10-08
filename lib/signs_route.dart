import 'package:flutter/material.dart';
import 'sign.dart';

class SignsRoute extends StatelessWidget {
  const SignsRoute();
  static const _signNames = <String>[
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn',
    'Aquarius',
    'Pisces'
  ];

  static const _colors = <Color>[
    Colors.red,
    Colors.green,
    Colors.lightGreenAccent,
    Colors.grey,
    Colors.amber,
    Colors.teal,
    Colors.lightBlue,
    Colors.brown,
    Colors.amber,
    Colors.purple,
    Colors.blue,
    Colors.yellow,
  ];

  Widget _buildCategoryWidgets(List<Widget> signs) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => signs[index],
      itemCount: signs.length
    );
  }

  @override
  Widget build(BuildContext context) {
    final signs = <Sign>[];

    for (var i = 0; i < _signNames.length; i ++) {
      signs.add(Sign(
        name: _signNames[i],
        color: _colors[i],
        iconLocation: Icons.account_balance
      ));
    }

    final listView = Container(
      color: Colors.white30,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(signs)
    );

    final appBar = AppBar(
      elevation: 0.5,
      title: Text(
        'Horowineoscopes',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white30
    );

    return Scaffold(
      appBar: appBar,
      body: listView
    );
  }
}