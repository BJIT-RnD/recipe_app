import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/view/pages/add_view.dart';
import 'package:recipes/view/pages/category_view.dart';
import 'package:recipes/view/pages/favorite_view.dart';
import 'package:recipes/view/pages/home_view.dart';

class RootViewModel extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(index) {
    selectedIndex(index);
  }

  final List<String> pageTitle = [
    "Search",
    "Categories",
    "Favorites",
    "New Recipe",
  ];

  final List<StatelessWidget> pages = [
    const HomeView(),
    const CategoryView(),
    const FavoriteView(),
    const AddView(),
  ].obs;
}
