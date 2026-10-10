import 'package:flutter/material.dart';
import 'package:ikigari/model/food_data.dart';
import 'package:ikigari/view/add_calories_page.dart';

//Este Widget sirve para los alimentos que se buscan en la Api (food_search_page)

class FoodSearcherCard extends StatelessWidget {
  const FoodSearcherCard({
    super.key,
    required this.id,
    required this.name,
    required this.caloriesPer100grams,
  });

  final String id;
  final String name;
  final double caloriesPer100grams;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFC8A2C8),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        subtitle: Text(
          "${caloriesPer100grams.toStringAsFixed(0)} kcal/100g",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
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
          icon: Icon(Icons.add_circle, color: Color(0xFFE8D5F5), size: 30),
        ),
      ),
    );
  }
}
