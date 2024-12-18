import 'package:flutter/material.dart';
import 'package:pos_flutter/home/model/cart_model.dart';
import 'package:intl/intl.dart';

class CartButton extends StatelessWidget {
  final CartModel cartModel;
  final Color primaryColor ;
  const CartButton({
    Key? key,
    required this.cartModel,
    required this.primaryColor
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
            offset: cartModel.getCount() > 0 ? Offset(0, 0) : Offset(0, 1), 
            duration: Duration(milliseconds: 300),
          
            child: Visibility(
              visible: cartModel.getCount() > 0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: (){}, 
                  child: Row(
                    children: [
                      Icon(Icons.local_grocery_store_outlined, color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text(
                        "${cartModel.getCount()} Items ",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Total: ฿ ${NumberFormat('#,###.00').format(cartModel.getTotalPrice())}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                  )
                
                
              ),
            ),
          );
  }
}