import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/interfaces/home/home_interface.dart';

class HomeService implements IHome {
  @override
  Future getListRecipies() async {
    var api = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final headers = {
      "x-rapidapi-key": "fda317fffamsh832588d0e7c5056p1324c0jsn6d9453078003",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    };
    final response = await http.get(api, headers: headers);
    if (response.statusCode == 200) {
      List details = [];
      List reviews = [];
      List description = [];
      List ingredients = [];
      List preparationSteps = [];
      Map dataReived = json.decode(response.body);

      for (dynamic i in dataReived['feed']) {
        details.add(i['content']['details']);
        reviews.add(i['content']['reviews']);
        description.add(i['content']['description']);
        ingredients.add(i['content']['ingredientLines']);
        preparationSteps.add(i['content']['preparationSteps']);
      }
      final body = [
        details,
        reviews,
        description,
        ingredients,
        preparationSteps,
      ];
      return body;
    } else {
      print('response body: ${response.body}');
      return null;
    }
  }

  @override
  Future getUserData() async {
    final _localStorage = await SharedPreferences.getInstance();
    String name;
    Future.delayed(Duration(milliseconds: 500), () {
      name = _localStorage.getString('NAME');
      return name;
    });
  }
}
