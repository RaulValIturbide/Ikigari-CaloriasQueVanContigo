import 'package:flutter/material.dart';
import 'package:ikigari/view/home_page.dart';
import 'package:ikigari/view/searcher_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [HomePage(), SearcherPage(), Placeholder()];
  final List<Widget> _navigations = [
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.food_bank), label: "Food"),
    NavigationDestination(icon: Icon(Icons.settings), label: "Setting"),
  ];
  int pageSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageSelected],
      bottomNavigationBar: NavigationBar(
        destinations: _navigations,
        selectedIndex: pageSelected,
        onDestinationSelected: (page){
          setState(() {
            pageSelected = page;
          });
        },
      ),
    );
  }
}
