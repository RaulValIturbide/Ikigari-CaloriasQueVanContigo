import 'package:flutter/material.dart';
import 'package:ikigari/model/Services/open_food_facts_service.dart';
import 'package:ikigari/model/Repository/ikigari_local_database.dart';
import 'package:ikigari/view/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OpenFoodFactsService.config();
  await IkigariLocalDatabase().getDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ikigari',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MainPage(),
    );
  }


}
