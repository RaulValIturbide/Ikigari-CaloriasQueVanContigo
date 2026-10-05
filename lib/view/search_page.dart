import 'package:flutter/material.dart';
import 'package:ikigari/controller/search_controller.dart' as search_contr;
import 'package:ikigari/model/food_data.dart';
import 'package:ikigari/view/widgets/food_consumed_card.dart';
import 'package:ikigari/view/widgets/food_show_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  search_contr.SearchController searchController =
  search_contr.SearchController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('IKIGARI'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: TextField(
                  decoration: InputDecoration(label: Text("Buscar alimento")),
                  onChanged: (value) {
                    setState(() {
                      searchController.resolveCoincidence(value);
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    FoodData item = searchController.listCoincidenceFood[index];
                    return FoodShowCard(
                      id: item.id,
                      name: item.name,
                      caloriesPer100grams: item.caloriesPer100g,
                    );
                  },
                  itemCount: searchController.listCoincidenceFood.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
