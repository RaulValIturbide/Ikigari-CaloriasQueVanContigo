import 'package:flutter/material.dart';
import 'package:ikigari/controller/searcher_controller.dart';
import 'package:ikigari/model/food_data.dart';
import 'package:ikigari/view/widgets/food_show_card.dart';

class SearcherPage extends StatefulWidget {
  const SearcherPage({super.key});

  @override
  State<SearcherPage> createState() => _SearcherPageState();
}

class _SearcherPageState extends State<SearcherPage> {
  SearcherController searchController = SearcherController();
  String userSearch = "";

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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text("Buscar alimento"),
                        ),
                        onChanged: (value){
                          userSearch = value;
                        },
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          searchController.resolveCoincidence(userSearch);
                        });
                      },
                      label: Text(""),
                      icon: Icon(Icons.search),
                    ),
                  ],
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
