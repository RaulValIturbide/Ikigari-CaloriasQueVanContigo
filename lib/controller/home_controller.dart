import 'package:ikigari/model/Repository/food_consumed_repository.dart';
import 'package:ikigari/model/food_consumed_data.dart';

class HomeController {
  final FoodConsumedRepository _repository = FoodConsumedRepository();
  List<FoodConsumedData> _foodConsumed = [];
  List<FoodConsumedData> get listFoodConsumed => _foodConsumed;

  Future<void> loadFoodConsumed() async {
    _foodConsumed = await _repository.selectFoodConsumed();
  }

  double dailyCalories() {
    double dailyTotal = 0;
    //await Future.delayed(Duration(seconds: 2));
    for (FoodConsumedData item in _foodConsumed) {
      dailyTotal += item.totalCalories;
    }
    return dailyTotal;
  }

}
