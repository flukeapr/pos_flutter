import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_flutter/screens/home/model/food_model.dart';

// ? productCard of grid view  : animated scale
class ProductCard extends StatefulWidget {
  final FoodModel food;
  final int index;
  final int crossAxisCount;
  final Function onAddToCart;
  final Color primaryColor;
  final Color secondary;
  const ProductCard({
    Key? key,
    required this.food,
    required this.index,
    required this.crossAxisCount,
    required this.onAddToCart,
    required this.primaryColor,
    required this.secondary,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double _scale = 1.0;
  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.8;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
      widget.onAddToCart();
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      onTapUp: _onTapUp,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
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
          child:  widget.crossAxisCount == 2
              ? Column(
                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        widget.food.image,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.food.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: widget.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //Condition
                       
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

                      ],
                    ),
                   
                    // Price and Add Button
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "฿ ${NumberFormat('#,###.00').format(widget.food.price)}",
                              style: TextStyle(
                                fontSize: 22,
                                color: widget.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: widget.primaryColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  widget.onAddToCart();
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        widget.food.image,
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
                            widget.food.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: widget.secondary,
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
                            "฿ ${NumberFormat('#,###.00').format(widget.food.price)}",
                            style: TextStyle(
                              fontSize: 16,
                              color: widget.primaryColor,
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
                        color: widget.primaryColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {
                          widget.onAddToCart();
                        },
                        icon: Icon(
                          Icons.add,
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
      ),
    );
  }
}
