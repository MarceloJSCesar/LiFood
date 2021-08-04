import 'package:shared_preferences/shared_preferences.dart';

abstract class IFavorite {
  Future saveFavoriteRecipe({
    String imageUrl,
    String recipeName,
    String totalTime,
    double rating,
  }) async {
    final _localStorage = await SharedPreferences.getInstance();
  }

  Future deleteFavoriteRecipe({
    String imageUrl,
    String recipeName,
    String totalTime,
    String rating,
  }) async {
    final _localStorage = await SharedPreferences.getInstance();
  }

  Future getFavoriteRecipe({
    String imageUrl,
    String recipeName,
    String totalTime,
    String rating,
  }) async {
    final _localStorage = await SharedPreferences.getInstance();
  }
}
