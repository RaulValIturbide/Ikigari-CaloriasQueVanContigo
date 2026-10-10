import 'package:openfoodfacts/openfoodfacts.dart';

class OpenFoodFactsService {
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
