import 'package:flutter/material.dart';
import 'package:recipes/model/dummy_data.dart';
// import 'package:recipes/model/dummy_data.dart';

class DetailsCardView extends StatelessWidget {
  final Recipe data;

  const DetailsCardView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // final data = Recipe(
    //   name: "Bucatini with mushrooms & sausage",
    //   calories: 794,
    //   makingTime: 22,
    //   category: FoodCategory.pastas,
    // );

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 8,
        color: Colors.white,
        child: SizedBox(
          height: 180,
          width: 160,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Image.asset(
                            "assets/pizza.jpg",
                            height: 100,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 2, 0),
                          child: IconButton(
                            onPressed: () {
                              debugPrint("fav button clicked!");
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            icon: const Icon(Icons.favorite_border),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      data.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        const Icon(
                          Icons.fiber_manual_record_outlined,
                          size: 10,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
