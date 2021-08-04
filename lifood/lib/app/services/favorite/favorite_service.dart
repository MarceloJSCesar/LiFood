import 'package:flutter/material.dart';
import 'package:lifood/app/interfaces/profile/profile_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService implements IFavorite {
  @override
  Future saveFavoriteRecipe({
    String imageUrl,
    String recipeName,
    String totalTime,
    double rating,
  }) async {
    final _localStorage = await SharedPreferences.getInstance();
    await _localStorage.setString('ImageUrl', imageUrl);
    await _localStorage.setString('RecipeName', recipeName);
    await _localStorage.setString('TotalTime', totalTime);
    await _localStorage.setDouble('Rating', rating);
  }

  @override
  Future deleteFavoriteRecipe({
    String imageUrl,
    String recipeName,
    String totalTime,
    String rating,
  }) async {
    final _localStorage = await SharedPreferences.getInstance();
    await _localStorage.remove(imageUrl);
    await _localStorage.remove(recipeName);
    await _localStorage.remove(totalTime);
    await _localStorage.remove(rating);
  }

  @override
  Future getFavoriteRecipe({
    String imageUrl,
    String recipeName,
    String totalTime,
    String rating,
  }) async {
    final _localStorage = await SharedPreferences.getInstance();
    Map recipeData = {};
    final name = _localStorage.getString(recipeName);
    final reviewRating = _localStorage.getDouble(rating);
    final time = _localStorage.getString(totalTime);
    final imagePath = _localStorage.getString(imageUrl);
    recipeData = {
      'name': name,
      'totalTime': time,
      'imageUrl': imagePath,
      'rating': reviewRating
    };
    return recipeData;
  }
}
