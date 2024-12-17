import 'package:flutter/material.dart';
import 'package:pos_flutter/home/data/food_data.dart';
import 'package:pos_flutter/home/model/food_model.dart';
import 'package:pos_flutter/home/screens/favorite.dart';
import 'package:pos_flutter/home/screens/home_body.dart';
import 'package:pos_flutter/home/screens/receipt.dart';
import 'package:pos_flutter/home/widget/buttonIcon.dart';
import 'package:pos_flutter/home/widget/listDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final double widthButton = MediaQuery.of(context).size.width - 20;
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color secondary = Theme.of(context).colorScheme.secondary;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double spacing = screenHeight * 0.08;
    final List<Widget> _page = [HomeBody(), FavoriteScreen(), ReceiptScreen()];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF4F6FA),
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              height: 200,
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: (){},
                      icon: Icon(
                        Icons.flag,
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                    Text("POS", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)  
                  ],)
                ]
              ),
              ),
              
  
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            ListDrawer(title: 'Cashier', icon: Icons.smart_screen),
            ListDrawer(title: 'History Transaction', icon: Icons.paid),
            ListDrawer(title: 'Report', icon: Icons.pie_chart),
            ListDrawer(title: 'Manage Store', icon: Icons.store),
            ListDrawer(title: 'Account', icon: Icons.person_outline),
            ListDrawer(title: 'Support', icon: Icons.support),
            
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cached,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, -15),
                    spreadRadius: 0)
              ],
            ),
            child: BottomAppBar(
                color: Colors.white,
                height: 70,
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.space_dashboard,
                        color: _selectedIndex == 0
                            ? primaryColor
                            : Colors.grey.shade400,
                        size: 40,
                      ),
                      onPressed: () {
                        _onItemTapped(0);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star_rounded,
                        color: _selectedIndex == 1
                            ? primaryColor
                            : Colors.grey.shade400,
                        size: 40,
                      ),
                      onPressed: () {
                        _onItemTapped(1);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.receipt_long,
                        color: _selectedIndex == 2
                            ? primaryColor
                            : Colors.grey.shade400,
                        size: 40,
                      ),
                      onPressed: () {
                        _onItemTapped(2);
                      },
                    ),
                  ],
                )),
          )),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Text(
          "Cashier",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: primaryColor,
          ),
        ),
        iconTheme: IconThemeData(color: primaryColor),
        leading: IconButton(
          onPressed: () {
            _openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: primaryColor,
            size: 30,
          ),
        ),
      ),
      body: _page[_selectedIndex],
    );
  }
}
