import 'package:flutter/material.dart';
import 'package:ikigari/controller/home_controller.dart';
import 'package:ikigari/model/food_consumed_data.dart';
import 'package:ikigari/view/widgets/food_consumed_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();
  late Future<void> _loadFoodConsumed;
  int objectiveCalories = 2400; //TEMPORAL

  @override
  void initState() {
    super.initState();
    _loadFoodConsumed = _homeController.loadFoodConsumed();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _loadFoodConsumed,
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return Text("Error Fatal: ${snapshot.error}");
        }else{
          double daily = _homeController.dailyCalories();
          return visual(objectiveCalories,daily,_homeController);
        }
    });


  }

  Widget visual(int objectiveCalories,double dailyCalories,HomeController homeController)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
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
              Text('${dailyCalories.toStringAsFixed(0)} / $objectiveCalories'),
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
