import 'dart:convert';
import '../../Models/RecipeModel.dart';
import 'package:http/http.dart' as http;
import '../URLs/url.dart';

class RecipesClass {

  Future<RecipeModel> getRecipes() async {
    var data;
    final response = await http.get(
      Uri.parse(AppUrl.baseUrl));
    data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {

      return RecipeModel.fromJson(data);

    } else {
      return RecipeModel.fromJson(data);
    }
  }}