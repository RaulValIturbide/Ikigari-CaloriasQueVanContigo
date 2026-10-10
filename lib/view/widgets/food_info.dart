import 'package:flutter/material.dart';
import 'package:ikigari/model/food_data.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({super.key, required this.foodData});

  final FoodData foodData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(foodData.name),
        trailing: Text('${foodData.caloriesPer100g} kcal x 100g'),
      ),
    );
  }
}
