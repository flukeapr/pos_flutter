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
  
  int _crossAxisCount = 2;
  double _childAspectRatio = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    final double widthScreen = MediaQuery.of(context).size.width;
      setState(() {
        _childAspectRatio = widthScreen / 550;
      });
    });
  }

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
                ButtonIcon(
                  icon: _crossAxisCount == 2
                      ? Icons.format_list_bulleted_rounded
                      : Icons.grid_view_rounded,
                  onPressed: () {
                    setState(() {
                      _crossAxisCount = _crossAxisCount == 2 ? 1 : 2;
                      _childAspectRatio = _crossAxisCount == 2
                          ? widthScreen / 550
                          : widthScreen / 100;
                    });
                  },
                ),
              ],
            ),
          ),
          // Product Grid/List View
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _crossAxisCount,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 20,
                  childAspectRatio: _childAspectRatio,
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
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: _crossAxisCount == 2
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    food.image,
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Name
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    food.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Condition
                                if (index == 0 || index == 3)
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
                                        "฿ ${food.price}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                // Image in Row Layout
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    food.image,
                                    height: 80,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        food.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: secondary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (index == 0 || index == 3)
                                        Text(
                                          "(Must choose level)",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      Text(
                                        "฿ ${food.price}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Add Button
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
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,)
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
