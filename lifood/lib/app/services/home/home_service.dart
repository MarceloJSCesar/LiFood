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
      List dataList = [];
      Map dataReived = json.decode(response.body);
      for (var i in dataReived['feed']) {
        dataList.add(i['content']['details']);
      }
      return dataList;
    } else {
      return null;
    }
  }
}
