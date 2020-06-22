import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordable {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;

  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;

  final int duration;

  final Complexity complexity;

  final Affordable affordable;

  final bool isGlutenFree;
  final bool isLactosFree;
  final bool isVegan;
  final bool isVegetarian;

  Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordable,
    @required this.isGlutenFree,
    @required this.isLactosFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
