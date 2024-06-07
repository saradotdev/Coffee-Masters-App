import 'package:flutter/material.dart';
import 'menupage.dart';
import 'offerspage.dart';
import 'orderpage.dart';
import '/datamanager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var selectedIndex = 1;
  var dataManager = DataManager(); // importing data in the home of app so that the same data can be used by both menu and order pages

  @override
  Widget build(BuildContext context) {
    Widget currentPage = const Text("");

    switch(selectedIndex) {
      case 0:
        currentPage = MenuPage(dataManager: dataManager,);
        break;
      case 1:
        currentPage = const OffersPage();
        break;
      case 2:
        currentPage = OrderPage(dataManager: dataManager,);
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),

      body: currentPage,
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow[400],
        unselectedItemColor: Colors.brown[50],
        items: const [
          BottomNavigationBarItem(
            label: 'Menu',
            icon: Icon(Icons.coffee),
          ),
          BottomNavigationBarItem(
            label: 'Offers',
            icon: Icon(Icons.local_offer),
          ),
          BottomNavigationBarItem(
            label: 'Order',
            icon: Icon(Icons.shopping_cart_checkout_outlined),
          ),
        ],
      ),
    );
  }
}