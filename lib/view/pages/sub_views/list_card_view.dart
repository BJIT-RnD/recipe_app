import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view_model/favorite_view_model.dart';

class ListCardView extends StatelessWidget {
  final Recipe data;
  const ListCardView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Get.find<FavoriteViewModel>();
    return Card(
      elevation: 8,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "./assets/chorizo.png",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            // color: Colors.teal,
            height: 75,
            // width: double.maxFinite,
            width: MediaQuery.of(context).size.width - 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                    Obx(
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
                  ],
                ),
                const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department_outlined,
                          size: 20,
                        ),
                        Text(
                          " ${data.calories} Kcal",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.query_builder,
                          size: 20,
                        ),
                        Text(
                          " ${data.makingTime} min",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
