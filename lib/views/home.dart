import 'package:flutter/material.dart';
//import 'package:food_recipe/views/widgets/recipe_card.dart';
import 'package:recipe_app/views/widgets/recipe_card.dart';
import 'package:recipe_app/modles/recipe.dart';
import 'package:recipe_app/modles/recipe_api.dart';

// import 'package:flutter/material.dart';
// import 'package:food_recipe/models/recipe.api.dart';
// import 'package:food_recipe/models/recipe.dart';
// import 'package:food_recipe/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = []; // Initialize _recipes as an empty list
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    List<Recipe> recipes = await RecipeApi.getRecipe();
    setState(() {
      _recipes = recipes; // Update _recipes with fetched data
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
