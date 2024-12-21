import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/home/widget/cartButton.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        children: [
          // Header Bar
          headerBar(widthScreen, AppColors.secondaryColor, context),
          // Product Grid/List View
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 20,
                  childAspectRatio: widthScreen / 550,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 2,
                                blurRadius: 2,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    "assets/images/salad-egg.png",
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 6,
                                  right: 6,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              // Name
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Egg salad",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Condition
                              if (index == 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "(Must choose level)",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              Spacer(),
                              // Price and Add Button
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "฿ ${NumberFormat('#,###.00').format(520)}",
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text(
                                "Add",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                }),
          ),
          // Expanded(child: ProductGrid()),
          CartButton(primaryColor: AppColors.primaryColor),
          SizedBox(
            height: 20,)
        ],
      ),
    );
  }
}

Widget headerBar(double widthScreen, Color secondary, BuildContext context) {
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
