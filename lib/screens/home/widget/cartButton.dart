import 'package:flutter/material.dart';
import 'package:pos_flutter/provider/cart_provider.dart';
import 'package:intl/intl.dart';
import 'package:pos_flutter/screens/home/screens/cart.dart';
import 'package:provider/provider.dart';

// ? cart button slide bottom grid view when add to cart item list
class CartButton extends StatelessWidget {
  final Color primaryColor ;
  const CartButton({
    Key? key,
    required this.primaryColor
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return AnimatedSlide(
            offset: cartProvider.getCount() > 0 ? Offset(0, 0) : Offset(0, 1), 
            duration: Duration(milliseconds: 300),
            child: Visibility(
              visible: cartProvider.getCount() > 0,
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
                  onPressed: (){
                  
                     Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                  }, 
                  child: Row(
                    children: [
                      Icon(Icons.local_grocery_store_outlined, color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text(
                        "${cartProvider.getCount()} Items ",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Total: ฿ ${NumberFormat('#,###.00').format(cartProvider.getTotalPrice())}",
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