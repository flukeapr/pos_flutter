import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/provider/cart_provider.dart';
import 'package:pos_flutter/screens/home/data/food_data.dart';
import 'package:pos_flutter/screens/home/model/cart_model.dart';
import 'package:pos_flutter/screens/home/model/food_model.dart';
import 'package:pos_flutter/screens/home/widget/buttonIcon.dart';
import 'package:pos_flutter/screens/home/widget/cartButton.dart';
import 'package:pos_flutter/screens/home/widget/productCard.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _crossAxisCount = 2;
  double _childAspectRatio = 1;
  CartModel cartModel = CartModel();
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

  void changeLayout() {
    setState(() {
      _crossAxisCount = _crossAxisCount == 2 ? 1 : 2;
      _childAspectRatio = _crossAxisCount == 2
          ? MediaQuery.of(context).size.width / 550
          : MediaQuery.of(context).size.width / 100;
    });
  }

  void addToCart(FoodModel food) {
    
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final cartModel = context.watch<CartProvider>();
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        children: [
          // Header Bar
          headerBar(
              widthScreen,
              AppColors.secondaryColor,
              _crossAxisCount,
              changeLayout,
              context),
          // Product Grid/List View
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
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
                return ProductCard(
                  food: food,
                  index: index,
                  crossAxisCount: _crossAxisCount,
                  primaryColor: AppColors.primaryColor,
                  secondary: AppColors.secondaryColor,
                  onAddToCart: (){
                    cartModel.addToCart(food);
                  },
                );
              },
            ),
          ),
          CartButton(
            primaryColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

Widget headerBar(double widthScreen, Color secondary, int _crossAxisCount,
    void changeLayout(), BuildContext context) {
  return SizedBox(
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
          onPressed: changeLayout,
        ),
      ],
    ),
  );
}
