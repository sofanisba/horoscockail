import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './shared_prefs.dart';

Future<Horoscope> fetchHoroscope(String sign) async {
  var shouldFetch = await Prefs.isDataStale(sign);

  if (shouldFetch) {
    await Prefs.clear();
    final response = await http
        .post('https://aztro.sameerkumar.website/?sign=$sign&date=today');
    if (response.statusCode == 200) {
      var horoscope = Horoscope.fromJson(json.decode(response.body));
      await Prefs.setHoroscope(sign, response.body);
      await Prefs.setLastFetched(sign);
      return horoscope;
    } else {
      throw Exception('fail');
    }
  } else {
    var h = await Prefs.getHoroscope(sign);
    return Horoscope.fromJson(json.decode(h));
  }
}

class Horoscope {
  final String description;
  final String color;
  final String mood;
  final String compatibility;

  Horoscope({this.description, this.color, this.mood, this.compatibility});

  factory Horoscope.fromJson(Map<String, dynamic> json) {
    return Horoscope(
        description: json['description'],
        color: json['color'],
        mood: json['mood'],
        compatibility: json['compatibility']);
  }
}
