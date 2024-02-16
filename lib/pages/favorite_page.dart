import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/components/favorite_icon_widget.dart';
import 'package:recipe_app/controllers/food_controller.dart';
import 'package:recipe_app/models/food_item.dart';

class FavoritePage extends StatelessWidget {
  final FoodController _foodController = Get.find<FoodController>();

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xE5D9D9D9),
      ),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 180,
          ),
          itemCount: _foodController.favoriteFoodItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            FoodItem favoriteFoodItem =
                _foodController.favoriteFoodItemsList[index];
            return _buildFoodItemCard(favoriteFoodItem);
          },
        );
      }),
    );
  }

  Widget _buildFoodItemCard(FoodItem foodItem) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 5),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // cover image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    image: foodItem.coverImage?.isNotEmpty == true
                        ? AssetImage(foodItem.coverImage!)
                        : const AssetImage('assets/images/placeholder.png'),
                  ),
                ),

                const SizedBox(height: 4),

                // title
                Text(
                  foodItem.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                // row of calories & time
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // calories icon
                    const Image(
                      image: AssetImage('assets/images/calories.png'),
                      height: 12,
                    ),
                    const SizedBox(width: 2),
                    // calorie
                    Text(
                      foodItem.calorie,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    // clock icon
                    const Icon(
                      Icons.timer_outlined,
                      size: 13,
                      color: Colors.grey,
                    ),
                    // time
                    Text(
                      foodItem.time ?? '',
                      style: const TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Obx(() {
              bool isFavorite =
                  _foodController.favoriteFoodItemsList.contains(foodItem);

              return FavoriteIconWidget(
                onTapFavoriteIcon: () {
                  if (isFavorite) {
                    _foodController.removeFavoriteFoodItem(foodItem);
                  } else {
                    _foodController.addFavoriteFoodItem(foodItem);
                  }
                },
                isFavorite: isFavorite,
              );
            }),
          ),
        )
      ],
    );
  }
}
