import 'package:get/get.dart';
import 'package:recipes/model/recipe.dart';

enum FoodCategory { breakfast, lunch, drinks, pastas, salads, desserts, soups }

class DummyData {
  static List<Recipe> dummyData = [
    Recipe(
      name: "Bucatini with mushrooms & sausage",
      calories: 794,
      makingTime: 22,
      category: FoodCategory.pastas,
    ),
    Recipe(
      name: 'Chorizo & mozzarella gnocchi bake',
      calories: 350,
      makingTime: 45,
      category: FoodCategory.pastas,
    ),
    Recipe(
      name: 'Huevos Rancheros',
      calories: 125,
      makingTime: 20,
      category: FoodCategory.breakfast,
    ),
    Recipe(
      name: 'Coconut & squash curry',
      calories: 350,
      makingTime: 45,
      category: FoodCategory.breakfast,
    ),
    Recipe(
      name: 'Black Forest Gateau',
      calories: 125,
      makingTime: 20,
      category: FoodCategory.desserts,
    ),
  ];
}

class RecipeData {
  static List<Recipe> data = [];
  static var filteredData = data.obs;
}
