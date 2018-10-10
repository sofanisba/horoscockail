// https://lcboapi.com/

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Wine> fetchWineRecommendation(String sign) async {
  final response =
  await http.post('https://aztro.sameerkumar.website/?sign=$sign&date=today');
  if (response.statusCode == 200) {
    print(response.body);
    return Wine.fromJson(json.decode(response.body));
  } else {
    throw Exception('fail');
  }
}

class Wine {
  final String description;
  final String color;
  final String mood;
  final String compatibility;

  Wine({this.description, this.color, this.mood, this.compatibility});

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
        description: json['description'],
        color: json['color'],
        mood: json['mood'],
        compatibility: json['compatibility']
    );
  }
}
