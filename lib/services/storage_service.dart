import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote.dart';

class StorageService {
  static const String _favoritesKey = 'favorites';
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  Future<List<Quote>> loadFavorites() async {
    final favoritesJson = _prefs.getStringList(_favoritesKey) ?? [];
    return favoritesJson
        .map((json) => Quote.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> saveFavorites(List<Quote> favorites) async {
    final favoritesJson = favorites
        .map((quote) => jsonEncode({
              'quote': quote.text,
              'author': quote.author,
              'isFavorite': quote.isFavorite,
            }))
        .toList();
    await _prefs.setStringList(_favoritesKey, favoritesJson);
  }

  Future<void> toggleFavorite(Quote quote) async {
    final favorites = await loadFavorites();
    final existingIndex = favorites.indexWhere((q) => 
        q.text == quote.text && q.author == quote.author);

    if (existingIndex >= 0) {
      favorites.removeAt(existingIndex);
    } else {
      quote.isFavorite = true;
      favorites.add(quote);
    }

    await saveFavorites(favorites);
  }

  Future<bool> isFavorite(Quote quote) async {
    final favorites = await loadFavorites();
    return favorites.any((q) => 
        q.text == quote.text && q.author == quote.author);
  }
}
