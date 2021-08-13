import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnc/screens/pages/home.dart';
import 'package:tnc/screens/pages/cart.dart';
import 'package:tnc/screens/pages/favorites.dart';
import 'package:tnc/screens/pages/menu.dart';
import 'package:tnc/screens/pages/orders.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  List<Widget> _widget = [
    HomePage(),
    CartPage(),
    OrderPage(),
    FavoritePage(),
    MenuPage(),
  ];

  List<String> _titleBar = [
    'T N C',
    'Cart',
    'Orders',
    'Favorite',
    'Menu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _titleBar[_currentIndex],
          style: GoogleFonts.openSans(
              fontSize: 30,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetails(),
                    ));
              },
              icon: Icon(Icons.person)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.call),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/hat.jpg'),
              ),
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail'),
              decoration: BoxDecoration(color: Colors.grey),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/hat.jpg'),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('your phone number'),
              dense: true,
              tileColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              trailing: Icon(Icons.phone),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.switch_account),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapped,
        iconSize: 20,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
      body: _widget[_currentIndex],
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
