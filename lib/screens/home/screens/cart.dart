import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
import 'package:pos_flutter/screens/home/widget/cartButton.dart';
import 'package:intl/intl.dart';
import 'package:pos_flutter/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final CartProvider cartProvider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColors.primaryColor,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 1),
        child: Column(
          children: [
            // Cart Grid/List View
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20,
                    childAspectRatio: widthScreen / 120,
                  ),
                  itemCount: cartProvider.cartList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.pop(context);
                        }
                        cartProvider
                            .removeFromCart(cartProvider.cartList[index]);
                      },
                      child: Container(
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
                        child: Row(
                          children: [
                            // Image in Row Layout
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                cartProvider.cartList[index].image,
                                height: 80,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cartProvider.cartList[index].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "(Must choose level)",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Quantity: ${cartProvider.cartList[index].quantity}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  Text(
                                    "฿ ${NumberFormat('#,###.00').format(cartProvider.cartList[index].price * cartProvider.cartList[index].quantity)}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Remove Button
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  if (index == 0) {
                                    Navigator.pop(context);
                                  }
                                  cartProvider.removeFromCart(
                                      cartProvider.cartList[index]);
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            // Expanded(child: ProductGrid()),
            CartButton(primaryColor: AppColors.primaryColor),
            SizedBox(
              height: 40,
            )
          ],
        ),
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
              "Cart",
              style: TextStyle(color: secondary, fontSize: 20),
            ),
          ),
        ),
      ],
    ),
  );
}
