import 'package:ikigari/model/food_data.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class OpenFoodFactsService {
  final List<FoodData> _fakeTempFoodList = [
    FoodData(id: "***", name: 'Pizza', caloriesPer100g: 300),
    FoodData(id: "***", name: 'Mango', caloriesPer100g: 200),
    FoodData(id: "***", name: 'Salchichas', caloriesPer100g: 100),
    FoodData(id: "***", name: 'Zumo', caloriesPer100g: 150),
    FoodData(id: "***", name: 'Mandarina', caloriesPer100g: 350),
  ];

  List<FoodData> get fakeList => _fakeTempFoodList;

  static void config() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: "Ikigari/1.0 (raulvaliturbide@gmail.com)",
      url: "https://github.com/RaulValIturbide/Ikigari-CaloriasQueVanContigo",
    );

    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.SPANISH,
    ];
    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.SPAIN;
  }
}
