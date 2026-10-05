import 'package:flutter/material.dart';

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
      ),
    );
  }
}
