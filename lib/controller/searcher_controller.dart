import 'package:ikigari/model/Services/open_food_facts_service.dart';
import 'package:ikigari/model/food_data.dart';

class SearcherController {

  final List<FoodData> _listCoincidenceFood = [];
  final List<FoodData> _allFoodList = OpenFoodFactsService().fakeList;

  List<FoodData> get listCoincidenceFood => _listCoincidenceFood;

  void resolveCoincidence(String user) {
    _listCoincidenceFood.clear();
    for (FoodData item in _allFoodList) {
      if (item.name.toLowerCase().trim().contains(user.toLowerCase().trim())) {
        _listCoincidenceFood.add(item);
      }
    }
  }
}
