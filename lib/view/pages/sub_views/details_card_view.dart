import 'package:flutter/material.dart';
import 'package:recipes/model/dummy_data.dart';
// import 'package:recipes/model/dummy_data.dart';

class DetailsCardView extends StatelessWidget {
  final Recipe data;

  const DetailsCardView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            "assets/chorizo.png",
                            height: 100,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 4, 2, 0),
                        //   child: IconButton(
                        //     onPressed: () {
                        //       debugPrint("fav button clicked!");
                        //     },
                        //     style: const ButtonStyle(
                        //       backgroundColor:
                        //           MaterialStatePropertyAll(Colors.white),
                        //     ),
                        //     icon: const Icon(Icons.favorite_border),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: IconButton(
                                color: Colors.black54,
                                alignment: Alignment.center,
                                iconSize: 20,
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                            ),
                          ),
                        )
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
                          fontWeight: FontWeight.w700, fontSize: 11),
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
                              size: 18,
                            ),
                            Text(
                              "${data.calories} Kcal",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          // margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.query_builder,
                              size: 18,
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
