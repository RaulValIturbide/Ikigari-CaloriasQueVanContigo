import 'package:flutter/material.dart';
import 'package:ikigari/controller/home_controller.dart';
import 'package:ikigari/model/food_consumed_data.dart';
import 'package:ikigari/view/widgets/food_consumed_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    int objectiveCalories = 2400;
    double dailyCalories = homeController.dailyCalories();
    String dailyCaloriesToShow = dailyCalories.toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('IKIGARI'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(width: 200, height: 200, child: Placeholder()),
              Text('CANTIDAD DE KCAL CONSUMIDAS HOY'),
              LinearProgressIndicator(
                value: dailyCalories / objectiveCalories,
                minHeight: 30,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                semanticsLabel: 'Calorias de hoy',
              ),
              Text('$dailyCaloriesToShow/$objectiveCalories'),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    FoodConsumedData itemConsumed =
                        homeController.listFoodConsumed[index];
                    return FoodConsumedCard(
                      name: itemConsumed.foodName,
                      calories: itemConsumed.totalCalories,
                      grams: itemConsumed.grams,
                    );
                  },
                  itemCount: homeController.listFoodConsumed.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
