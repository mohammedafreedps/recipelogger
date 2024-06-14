import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipelog/models/recipe_model.dart';

List<RecipeModel> recipes = [];
int totalRecipes = 0;
int yourTotalRecipes = 0;
List<String> categoryPrecent = [];
List<int> categoryWiseTotal = [];
User? currentUser;