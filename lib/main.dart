import 'package:flutter/material.dart';
import 'package:ikigari/model/Repository/food_consumed_repository.dart';
import 'package:ikigari/model/Repository/ikigari_local_database.dart';
import 'package:ikigari/model/food_consumed_data.dart';
import 'package:ikigari/view/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
