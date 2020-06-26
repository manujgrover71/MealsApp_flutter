import 'package:flutter/material.dart';

import './screens/tab_screens.dart';
import './screens/catergory_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/filter_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true; 
      }).toList();
    });
  }

  bool _isMealFavourite(String id) {
    return _favMeals.any((meal) => meal.id == id);
  }

  void _toggleFav(String mealId) {
    final existingIndex = _favMeals.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >= 0) {
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    }else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.yellow[500],
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )
            ),
      ),
      routes: {
        '/' : (ctx) => TabScreen(_favMeals  ),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(_toggleFav, _isMealFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
      },
    );
  }
}
