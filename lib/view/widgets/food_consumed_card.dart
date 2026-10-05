import 'package:flutter/material.dart';

class FoodConsumedCard extends StatelessWidget {
  const FoodConsumedCard({
    super.key,
    required this.name,
    required this.calories,
    required this.grams,
  });

  final String name;
  final double calories;
  final double grams;

  @override
  Widget build(BuildContext context) {
    String caloriesToShow = calories.toStringAsFixed(0);
    String gramsToShow = grams.toStringAsFixed(0);
    return Card(
      child: ListTile(
        title: Text(name),
        trailing: Text('$caloriesToShow kcal'),
        subtitle: Text('$gramsToShow gr'),
      ),
    );
  }
}
