import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/view_model/favorite_view_model.dart';

class FullCardView extends StatelessWidget {
  final Recipe data;
  const FullCardView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Get.find<FavoriteViewModel>();
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          "./assets/chorizo.png",
          height: 230,
          // width: 160,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 35,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Obx(
                      () => Center(
                        child: IconButton(
                          color: favoriteViewModel.favList.contains(data)
                              ? Colors.red
                              : Colors.black54,
                          alignment: Alignment.center,
                          iconSize: 20,
                          onPressed: () {
                            if (favoriteViewModel.favList.contains(data)) {
                              favoriteViewModel.favList.remove(data);
                            } else {
                              favoriteViewModel.favList.add(data);
                            }
                          },
                          icon: favoriteViewModel.favList.contains(data)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 130,
                    child: Stack(
                      children: [
                        Text(
                          data.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            // color: Colors.white,
                            foreground: Paint()
                              ..color = Colors.black
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2,
                          ),
                        ),
                        Text(
                          data.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ],
        )
      ],
    );
  }
}
