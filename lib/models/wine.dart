// https://lcboapi.com/

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Wine> fetchWine() async {
  const accessKey =
      "MDplZTdlZDdjMC1jYzNlLTExZTgtYjU0OC05MzNmYjc0ZWM5MzM6WGZaeGQzYVJ2M1ZBRWZUN0VFNFR3YTNxMjZJUEtLNVZKQmxV";
  const params =
      "per_page=12&q=wine&page=3&where_not=is_dead&where_not=is_discontinued";
  const url = "https://lcboapi.com/products?access_key=$accessKey&$params";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return Wine.fromJson(json.decode(response.body));
  } else {
    throw Exception('fail');
  }
}

class Wine {
  final String name;
  final String varietal;
  final String style;
  final String tastingNote;
  final String price;
  final String category;
  final String origin;
  final String imageThumb;

  Wine(
      {this.name,
      this.varietal,
      this.style,
      this.tastingNote,
      this.price,
      this.category,
      this.origin,
      this.imageThumb});

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
        name: json['result'][0]['name'],
        varietal: json['result'][0]['varietal'],
        style: json['result'][0]['style'],
        tastingNote: json['result'][0]['tasting_note'],
        price: json['result'][0]['price'],
        category: json['result'][0]['category'],
        origin: json['result'][0]['origin'],
        imageThumb: json['result'][0]['image_thumb_url']);
  }
}
