import 'package:flutter/material.dart';
import 'package:pos_flutter/home/data/food_data.dart';
import 'package:pos_flutter/home/model/food_model.dart';
import 'package:pos_flutter/home/widget/buttonIcon.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeState();
}

class _HomeState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color secondary = Theme.of(context).colorScheme.secondary;
    final double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(
        top: 1,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  width: widthScreen * 0.55,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "ALL Products ",
                      style: TextStyle(color: secondary, fontSize: 20),
                    ),
                  ),
                ),
                ButtonIcon(icon: Icons.search),
                ButtonIcon(icon: Icons.credit_card),
                ButtonIcon(icon: Icons.format_list_bulleted_rounded),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 40,
                  childAspectRatio: widthScreen / 550,
                ),
                itemCount: FoodData.foodList.length,
                itemBuilder: (context, index) {
                  FoodModel food = FoodData.foodList[index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 2),
                        ]),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(
                              food.image,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              food.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: secondary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          (index == 0 || index == 3)
                              ? Text(
                                  "(Must choose level)",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15),
                                )
                              : Container(),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("฿ ${food.price}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
