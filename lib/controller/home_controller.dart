import 'package:ikigari/model/food_consumed_data.dart';

class HomeController {
  final List<FoodConsumedData> _listFoodConsumed = [
    FoodConsumedData(
      id: 1,
      foodId: "000-pizza",
      foodName: 'Pizza',
      foodCaloriesPer100g: 250,
      grams: 400,
      dateAndHour: DateTime.now(),
    ),
    FoodConsumedData(
      id: 2,
      foodId: "000-pizza",
      foodName: 'Pizza',
      foodCaloriesPer100g: 250,
      grams: 400,
      dateAndHour: DateTime.now(),
    ),
    FoodConsumedData(
      id: 3,
      foodId: "000-apple",
      foodName: 'Apple',
      foodCaloriesPer100g: 55,
      grams: 150,
      dateAndHour: DateTime.now(),
    ),
  ];

  Future<double> dailyCalories() async {
    double dailyTotal = 0;
    await Future.delayed(Duration(seconds: 2));

    for (FoodConsumedData item in _listFoodConsumed) {
      dailyTotal += item.totalCalories;
    }
    return dailyTotal;
  }

  List<FoodConsumedData> get listFoodConsumed => _listFoodConsumed;
}
