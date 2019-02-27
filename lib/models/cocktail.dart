//https://www.thecocktaildb.com/api.php

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Cocktail> fetchCocktail() async {
  const accessKey = '1';
  const url = 'https://www.thecocktaildb.com/api/json/v1/$accessKey/random.php';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return Cocktail.fromJson(json.decode(response.body));
  } else {
    throw Exception('fail');
  }
}

class Cocktail {
  final String name;
  final String glass;
  final String instructions;
  final String thumbnail;
  final List ingredients;

  Cocktail({
    this.name,
    this.glass,
    this.instructions,
    this.thumbnail,
    this.ingredients,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    var res = json['drinks'][0];
    var ingredients = [];

    for (var i = 1; i <= 15; i++) {
      if (res['strIngrdient$i'] != '' && res['strMeasure$i'] != '') {
        ingredients.add({
          'ingredient': res['strIngredient$i'],
          'measure': res['strMeasure$i']
        });
      }
    }

    return Cocktail(
        name: res['strDrink'],
        glass: res['strGlass'],
        instructions: res['strInstructions'],
        thumbnail: res['strDrinkThumb'],
        ingredients: ingredients);
  }
}
