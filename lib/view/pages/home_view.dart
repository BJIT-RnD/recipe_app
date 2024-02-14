import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view/pages/sub_views/details_card_view.dart';
import 'package:recipes/view/pages/sub_views/full_card_view.dart';
import 'package:recipes/view/pages/sub_views/list_card_view.dart';
import 'package:recipes/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();
    // return const TypeOneView();
    // return const TypeTwoView();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 22, 8),
              child: Obx(
                () => ToggleButtons(
                  constraints:
                      const BoxConstraints(minWidth: 40, minHeight: 30),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisSpacing: 0,
          // crossAxisSpacing: 0,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return DetailsCardView(data: RecipeData.data[index]);
        },
        itemCount: RecipeData.data.length,
      ),
    );
  }
}

class TypeTwoView extends StatelessWidget {
  const TypeTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListCardView(data: RecipeData.data[index]);
      },
      itemCount: RecipeData.data.length,
      padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
    );
  }
}

class TypeThreeView extends StatelessWidget {
  const TypeThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          return FullCardView(data: RecipeData.data[index]);
        },
        itemCount: RecipeData.data.length,
      ),
    );
  }
}
