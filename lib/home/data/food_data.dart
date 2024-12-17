import 'package:pos_flutter/home/model/food_model.dart';

class FoodData {
  static FoodModel saladTuna = FoodModel(
    id: 1,
    name: 'Salad Tuna',
    price: 1200,
    image: 'assets/images/salad-tuna.png',
  );
  static FoodModel saladEgg = FoodModel(
    id: 2,
    name: 'Salad Egg',
    price: 520,
    image: 'assets/images/salad-egg.png',
  );
  static FoodModel wagyuSate = FoodModel(
    id: 3,
    name: 'Wagyu Sate',
    price: 860,
    image: 'assets/images/wagyu-sate.png',
  );
  static FoodModel wagyuBlackPaper = FoodModel(
    id: 4,
    name: 'Wagyu Black Paper',
    price: 4500,
    image: 'assets/images/wagyu-black-paper.png',
  );
  static List<FoodModel> foodList = [
    saladTuna,
    saladEgg,
    wagyuSate,
    wagyuBlackPaper,
  ];
}