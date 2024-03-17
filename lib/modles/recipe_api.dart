import 'dart:convert';
//import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/modles/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "8098ffa0bfmshe8c3314adea97c6p13ca7fjsn6ee3c290edb8",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
      //print(_temp[i]);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}