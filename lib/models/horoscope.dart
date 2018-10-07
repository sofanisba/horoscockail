import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Horoscope> fetchHoroscope(String sign) async {
 final response =
    await http.post('https://aztro.sameerkumar.website/?sign=$sign&date=today');
 if (response.statusCode == 200) {
     return Horoscope.fromJson(json.decode(response.body));
 } else {
   throw Exception('fail');
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
      compatibility: json['compatiblity']
    );
  }
}
