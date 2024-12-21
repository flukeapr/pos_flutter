import 'package:flutter/material.dart';
import 'package:pos_flutter/screens/home/model/food_model.dart';

class CartProvider extends ChangeNotifier{
   List<FoodModel> cartList = [];


  void addToCart(FoodModel foodModel) {
    final exitingFood = cartList.firstWhere(
      (food)=> food.id == foodModel.id,
      orElse: () => FoodModel( id: 0, name: '', image: '', price: 0.0, quantity: 0),
    );

    if (exitingFood.quantity > 0) {
      exitingFood.quantity++;
    }else{
    cartList.add(foodModel);
    }
    notifyListeners();
  }

  void removeFromCart(FoodModel foodModel) {
     final existingFood = cartList.firstWhere(
    (food) => food.id == foodModel.id,
    orElse: () => FoodModel(name: '', id: 0, image: '', price: 0.0, quantity: 0),
  );
  if (existingFood.quantity > 1) {
    existingFood.quantity = existingFood.quantity - 1; 
  } else {
    cartList.remove(existingFood); 
  }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var food in cartList) {
      total += food.price * food.quantity;
    }
    return total;
  }

  void clearCart() {
    cartList.clear();
    notifyListeners();
  }

  int getCount() {
    int totalCount = 0;
    for (var food in cartList) {
      totalCount += food.quantity;
    }
    return totalCount;
  }
}
