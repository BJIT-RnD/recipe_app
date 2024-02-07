import 'package:flutter/material.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view/pages/sub_views/details_card_view.dart';
// import 'package:recipes/view/pages/sub_views/test.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final data = Recipe(
    name: 'Chorizo & mozzarella gnocchi bake',
    calories: 350,
    makingTime: 45,
    category: FoodCategory.pastas,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        return DetailsCardView(data: data);
      },
      itemCount: 7,
    );

    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Card(
    //         elevation: 10,
    //         child: Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Container(
    //             color: arrColors[index],
    //             child: const Text("Ola!"),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    //   itemCount: arrColors.length,
    //   padding: const EdgeInsets.all(8),
    // );

    // return const Card(
    //   elevation: 10,
    //   child: Padding(
    //     padding: EdgeInsets.all(8.0),
    //     child: Text('Hello'),
    //   ),
    // );
    // return DetailsCardView(data: data);
    // return const Test();
  }
}
