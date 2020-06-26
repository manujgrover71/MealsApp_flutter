import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavouriteScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - Go add some!!'),
      );
    }else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favMeals[index].id,
              title: favMeals[index].title,
              imageUrl: favMeals[index].imageUrl,
              duration: favMeals[index].duration,
              affordability: favMeals[index].affordability,
              complexity: favMeals[index].complexity,
            );
          },
          itemCount: favMeals.length,
        );
    }
  }
}
