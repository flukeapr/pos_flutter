class FoodModel {
  final int id;
  final String name;
  final String image;
  final double price;
   int quantity;


  FoodModel({required this.id, required this.name, required this.image, required this.price,  this.quantity =1});


}