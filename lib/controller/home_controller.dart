import 'package:ikigari/model/food_consumed_data.dart';

class HomeController {
  final List<FoodConsumedData> _listFoodConsumed = [
    FoodConsumedData(
      id: 0,
      foodId: 1,
      foodName: 'Pizza',
      foodCaloriesPer100g: 250,
      grams: 400,
      dateAndHour: DateTime.now(),
    ),
    FoodConsumedData(
      id: 1,
      foodId: 1,
      foodName: 'Pizza',
      foodCaloriesPer100g: 250,
      grams: 400,
      dateAndHour: DateTime.now(),
    ),
    FoodConsumedData(
      id: 2,
      foodId: 3,
      foodName: 'Apple',
      foodCaloriesPer100g: 55,
      grams: 150,
      dateAndHour: DateTime.now(),
    ),
  ];

  double dailyCalories() {
    double dailyTotal = 0;
    for (FoodConsumedData item in _listFoodConsumed) {
      dailyTotal += item.totalCalories;
    }
    return dailyTotal;
  }
  List<FoodConsumedData> get listFoodConsumed => _listFoodConsumed;
}
