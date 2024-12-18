import 'food_model.dart';

class CartModel {
  List<FoodModel> cartList = [];


  void addToCart(FoodModel foodModel) {
    cartList.add(foodModel);
  }

  void removeFromCart(FoodModel foodModel) {
    cartList.remove(foodModel);
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