import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
     final Color primaryColor = Theme.of(context).primaryColor;
    final Color secondary = Theme.of(context).colorScheme.secondary;
    final double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        children: [
          // Header Bar
          headerBar(widthScreen, secondary,context),
          // Product Grid/List View
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                 shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 20,
                  childAspectRatio: widthScreen / 550,
                ),
                itemCount: 2,
                 itemBuilder: (context, index) {
                   return Container(
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.shade300,
                           spreadRadius: 1,
                         ),
                       ],
                       color: Colors.white,
                     ),
                   );
                 }
                 ),
            ),
          )
          // Expanded(child: ProductGrid()),
        ],
      ),
    );
  }
}

Widget headerBar(double widthScreen, Color secondary,BuildContext context) {
  return Container(
    width: double.infinity,
    height: 60,
    color: Colors.white,
    child: Row(
      children: [
        SizedBox(
          height: 60,
          width: widthScreen * 0.55,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Special menu",
              style: TextStyle(color: secondary, fontSize: 20),
            ),
          ),
        ),
        
      ],
    ),
  );
}
