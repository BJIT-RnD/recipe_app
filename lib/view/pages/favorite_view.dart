import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/view/pages/sub_views/details_card_view.dart';
import 'package:recipes/view_model/favorite_view_model.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Get.find<FavoriteViewModel>();
    return Obx(
      () => favoriteViewModel.favList.isNotEmpty
          ? const FavView()
          : const EmptyFavView(),
    );
  }
}

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Get.find<FavoriteViewModel>();
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
            return DetailsCardView(data: favoriteViewModel.favList[index]);
          },
          itemCount: favoriteViewModel.favList.length,
        ),
      ),
    );
  }
}

class EmptyFavView extends StatelessWidget {
  const EmptyFavView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
