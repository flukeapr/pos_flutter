import 'package:flutter/material.dart';
import 'package:pos_flutter/home/model/food_model.dart';

class CartProvider extends ChangeNotifier{
   List<FoodModel> cartList = [];


  void addToCart(FoodModel foodModel) {
    cartList.add(foodModel);
    notifyListeners();
  }

  void removeFromCart(FoodModel foodModel) {
    cartList.remove(foodModel);
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      total += cartList[i].price;
    }
    return total;
  }

  void clearCart() {
    cartList.clear();
  }

  int getCount() {
    return cartList.length;
  }
}
