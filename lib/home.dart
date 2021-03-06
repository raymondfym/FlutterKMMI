import 'package:flutter/material.dart';
// import 'package:fooderlich/models/models.dart';
// import 'components/components.dart';
// import 'models/explore_recipe.dart';
import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';
import 'screens/grocery_screen.dart';
import 'screens/custom_search_delgates.dart';
import 'models/tab_manager.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
    SearchBar()
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Fooderlich',
                style: Theme.of(context).textTheme.headline6),),
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          //Untuk Membuat 4 Item di Bottom Nav Bar
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context)
            .textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },

            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.explore), 
                  label: 'Explore',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.book), 
                  label: 'Recipes',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list), 
                  label: 'To Buy',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), 
                  label: 'Search',),
            ],
        ),
      );
    },
    );
  }
}