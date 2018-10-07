import 'package:flutter/material.dart';
import 'models/horoscope.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Winetrology',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Some bullshit'),
        ),
        body: Center(
          child: FutureBuilder<Horoscope>(
            future: fetchHoroscope('virgo'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.description);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }
          )
        )
      )
    );
  }
}
