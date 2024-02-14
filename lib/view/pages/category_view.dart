import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 4),
          child: Card(
            elevation: 8,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (FoodCategory.values[index].toString().split(".").last)
                          .capitalizeFirst!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      "assets/${FoodCategory.values[index].toString().split(".").last}.png",
                      height: 45,
                      width: 45,
                      fit: BoxFit.fill,
                    ),
                  ],
                )),
          ),
        );
      },
      itemCount: FoodCategory.values.length,
      padding: const EdgeInsets.all(8),
    );
  }
}
