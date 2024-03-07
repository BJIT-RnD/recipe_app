import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipes/bindings/all_bindings.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/view/root_view.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  var box = await Hive.openBox("recipe");
  List<dynamic>? serializedRecipes = box.get("recipes") as List?;

  if (serializedRecipes != null) {
    RecipeData.data = serializedRecipes.map((e) => Recipe.fromJson(e)).toList();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipes App',
      initialBinding: AllBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RootView(),
    );
  }
}
