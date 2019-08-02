//https://www.thecocktaildb.com/api.php

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './shared_prefs.dart';

Future<Cocktail> fetchCocktail(String sign) async {
  final cocktailKey = Prefs.getCocktailKey(sign);
  final shouldFetch = await Prefs.isDataStale(cocktailKey);
  if (shouldFetch) {
    const accessKey = '1';
    const url =
        'https://www.thecocktaildb.com/api/json/v1/$accessKey/random.php';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      await Prefs.setCocktail(sign, response.body);
      await Prefs.setLastFetched(cocktailKey);
      return Cocktail.fromJson(json.decode(response.body));
    } else {
      throw Exception('fail');
    }
  } else {
    final cocktail = await Prefs.getCocktail(sign);
    return Cocktail.fromJson(json.decode(cocktail));
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
      ingredients.add({
        'ingredient': res['strIngredient$i'],
        'measure': res['strMeasure$i']
      });
    }

    return Cocktail(
        name: res['strDrink'],
        glass: res['strGlass'],
        instructions: res['strInstructions'],
        thumbnail: res['strDrinkThumb'],
        ingredients: ingredients);
  }
}
