import 'package:flutter/material.dart';
import 'package:ikigari/view/widgets/food_info.dart';

import '../model/food_data.dart';

class AddCaloriesPage extends StatefulWidget {
  const AddCaloriesPage({super.key, required this.foodData});

  final FoodData foodData;

  @override
  State<AddCaloriesPage> createState() => _AddCaloriesPageState();
}

class _AddCaloriesPageState extends State<AddCaloriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alimento"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        spacing: 20,
        children: [
          SizedBox(
            child: FoodInfo(foodData: widget.foodData),
            width: 300,
            height: 150,
          ),
          TextField(decoration: InputDecoration(label: Text("Gramos"))),
        ],
      ),
    );
  }
}
