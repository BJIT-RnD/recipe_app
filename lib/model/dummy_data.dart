enum FoodCategory { breakfast, lunch, drinks, pastas, salads, desserts, soups }

class Recipe {
  String name;
  int calories;
  int makingTime;
  FoodCategory category;
  bool isFav = false;

  Recipe({
    required this.name,
    required this.calories,
    required this.makingTime,
    required this.category,
    bool isFav = false,
  });
}

class RecipeData {
  static List<Recipe> data = [
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
