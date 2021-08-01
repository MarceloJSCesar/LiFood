import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../app/models/recipie.dart';
import '../../../app/interfaces/home/home_interface.dart';

class HomeService implements IHome {
  @override
  Future<List> getListRecipies() async {
    var api = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final headers = {
      "x-rapidapi-key": "92e1c8bcd1msh33dce8bdf8dfb9ep1de753jsn9689afea0e83",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    };
    final response = await http.get(api, headers: headers);
    if (response.statusCode == 200) {
      Map dataReived = json.decode(response.body);
    }
    final dataList = [];
  }
}

class RecipeApi {
  static Future getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "92e1c8bcd1msh33dce8bdf8dfb9ep1de753jsn9689afea0e83",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    print(response.statusCode);
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return _temp;
  }
}
