import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static getCocktailKey(String sign) {
    return '${sign}_cocktail';
  }

  static Future<bool> isDataStale(String key) async {
    final p = await prefs;
    var time = p.getString("${key}_last_fetch") ?? '';
    if (time.length > 0) {
      var now = new DateTime.now();
      final todayMidnight = new DateTime(now.year, now.month, now.day);
      var lastFetch = DateTime.parse(time).add(new Duration(days: 1));
      return todayMidnight.isAfter(lastFetch);
    } else {
      return true;
    }
  }

  static Future<String> getHoroscope(sign) async {
    final p = await prefs;
    return jsonDecode(p.getString(sign)) ?? '';
  }

  static Future<String> getCocktail(sign) async {
    final p = await prefs;
    return jsonDecode(p.getString('${sign}_cocktail')) ?? '';
  }

  static Future setLastFetched(String key) async {
    final p = await prefs;
    var now = new DateTime.now();
    final time = new DateTime(now.year, now.month, now.day).toString();
    return p.setString('${key}_last_fetch', time);
  }

  static Future setHoroscope(String sign, Object horoscope) async {
    final p = await prefs;
    final values = jsonEncode(horoscope);
    return p.setString(sign, values);
  }

  static Future setCocktail(String sign, Object cocktail) async {
    final p = await prefs;
    final values = jsonEncode(cocktail);
    final key = '${sign}_cocktail';
    return p.setString(key, values);
  }

  static Future<void> clear() async {
    final p = await prefs;
    p.clear();
  }

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
