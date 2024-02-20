import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view/pages/sub_views/details_card_view.dart';
import 'package:recipes/view/pages/sub_views/full_card_view.dart';
import 'package:recipes/view/pages/sub_views/list_card_view.dart';
import 'package:recipes/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _doFilter(String value) {
    if (value.isEmpty) {
      RecipeData.filteredData.value = RecipeData.data;
    } else {
      RecipeData.filteredData.value = RecipeData.data
          .where((recipe) =>
              recipe.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What is in your kitchen?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "Enter your recipe name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                child: TextField(
                  controller: homeViewModel.searchController,
                  cursorColor: Colors.black45,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelStyle: TextStyle(
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.all(14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.cyan,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.cyan,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Type your recipe",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) => _doFilter(value),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 22, 0),
              child: Obx(
                () => ToggleButtons(
                  constraints:
                      const BoxConstraints(minWidth: 30, minHeight: 30),
                  isSelected: homeViewModel.isSelected,
                  selectedColor: Colors.white,
                  fillColor: Colors.cyan[200],
                  onPressed: (index) {
                    homeViewModel.selectedIndex.value = index;
                    for (var i = 0; i < homeViewModel.isSelected.length; i++) {
                      if (i == index) {
                        homeViewModel.isSelected[i] = true;
                      } else {
                        homeViewModel.isSelected[i] = false;
                      }
                    }
                  },
                  children: const [
                    Icon(Icons.grid_view),
                    Icon(Icons.reorder),
                    Icon(Icons.window),
                  ],
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => Expanded(
            child: homeViewModel.displayItem[homeViewModel.selectedIndex.value],
          ),
        ),
      ],
    );
  }
}

class TypeOneView extends StatelessWidget {
  const TypeOneView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisSpacing: 0,
            // crossAxisSpacing: 0,
            mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            return DetailsCardView(data: homeViewModel.data.value[index]);
          },
          itemCount: homeViewModel.data.value.length,
        ),
      ),
    );
  }
}

class TypeTwoView extends StatelessWidget {
  const TypeTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();
    return Obx(
      () => ListView.builder(
        itemBuilder: (context, index) {
          return ListCardView(data: homeViewModel.data.value[index]);
        },
        itemExtent: 100,
        itemCount: homeViewModel.data.value.length,
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
      ),
    );
  }
}

class TypeThreeView extends StatelessWidget {
  const TypeThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
        // padding: const EdgeInsets.all(0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 230,
          ),
          itemBuilder: (context, index) {
            return FullCardView(data: homeViewModel.data.value[index]);
          },
          itemCount: homeViewModel.data.value.length,
        ),
      ),
    );
  }
}
