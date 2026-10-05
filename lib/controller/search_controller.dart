import 'package:ikigari/model/food_data.dart';

class SearchController {
  List<FoodData> listAllFood = [
    FoodData(id: 0, name: 'Pizza', caloriesPer100g: 300),
    FoodData(id: 1, name: 'Mango', caloriesPer100g: 200),
    FoodData(id: 2, name: 'Salchichas', caloriesPer100g: 100),
    FoodData(id: 3, name: 'Zumo', caloriesPer100g: 150),
    FoodData(id: 4, name: 'Mandarina', caloriesPer100g: 350),
  ];
  final List<FoodData> _listCoincidenceFood = [];

  List<FoodData> get listCoincidenceFood => _listCoincidenceFood;

  void resolveCoincidence(String user) {
    _listCoincidenceFood.clear();
    for (FoodData item in listAllFood) {
      if (item.name.toLowerCase().trim().contains(user.toLowerCase().trim())) {
        _listCoincidenceFood.add(item);
      }
    }
  }
}
