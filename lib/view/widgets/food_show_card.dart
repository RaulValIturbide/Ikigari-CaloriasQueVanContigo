import 'package:flutter/material.dart';
import 'package:ikigari/model/food_data.dart';
import 'package:ikigari/view/add_calories_page.dart';

class FoodShowCard extends StatelessWidget {
  const FoodShowCard({
    super.key,
    required this.id,
    required this.name,
    required this.caloriesPer100grams,
  });

  final int id;
  final String name;
  final double caloriesPer100grams;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(Colors.lightGreen.toARGB32()),
      child: ListTile(
        title: Text(name),
        subtitle: Text("${caloriesPer100grams.toStringAsFixed(0)} kcal/100g"),
        trailing: IconButton(
          onPressed: () {
            FoodData item = FoodData(
              id: id,
              name: name,
              caloriesPer100g: caloriesPer100grams,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCaloriesPage(foodData: item),
              ),
            );
          },
          icon: Icon(Icons.add_circle, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
