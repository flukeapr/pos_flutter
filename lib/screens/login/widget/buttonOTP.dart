import 'package:flutter/material.dart';
import 'package:pos_flutter/Colors/appColors.dart';
class ButtonOtp extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const ButtonOtp({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, 
      height: 45,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primaryColor : Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
                  icon,
                  color: isSelected ? Colors.white : AppColors.secondaryColor,
                  size: 20,
                ) ,
        label: Text(
          text,
          style:  TextStyle(
            color: isSelected ? Colors.white : AppColors.secondaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}