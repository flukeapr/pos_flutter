import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/home/screens/favorite.dart';
import 'package:pos_flutter/screens/home/screens/home_body.dart';
import 'package:pos_flutter/screens/home/screens/receipt.dart';
import 'package:pos_flutter/screens/home/widget/drawerHome.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> _page = [HomeBody(), FavoriteScreen(), ReceiptScreen()];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF4F6FA),
      drawer: DrawerHome(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Text(
          "Cashier",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColors.primaryColor,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        leading: IconButton(
          onPressed: () {
            _openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ),
      body: _page[_selectedIndex],
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
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
                            ? AppColors.primaryColor
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
                            ? AppColors.primaryColor
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
                            ? AppColors.primaryColor
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
    );
  }
}
