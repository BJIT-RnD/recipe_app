import 'package:hive/hive.dart';
import 'package:recipes/model/dummy_data.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  String name = "";
  @HiveField(1)
  int calories = 0;
  @HiveField(2)
  int makingTime = 0;
  @HiveField(3)
  FoodCategory category = FoodCategory.breakfast;
  @HiveField(4)
  bool isFav = false;

  Recipe({
    required this.name,
    required this.calories,
    required this.makingTime,
    required this.category,
    bool isFav = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calories': calories,
      'makingTime': makingTime,
      'category': category,
      'isFav': isFav,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      calories: json['calories'],
      makingTime: json['makingTime'],
      category: json['category'],
      isFav: json['isFav'],
    );
  }
}
