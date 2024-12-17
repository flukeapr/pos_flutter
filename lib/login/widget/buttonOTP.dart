import 'package:flutter/material.dart';
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
     final Color primaryColor = Theme.of(context).primaryColor;
    final Color secondary = Theme.of(context).colorScheme.secondary;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double spacing = screenHeight * 0.08;
    return SizedBox(
      width: 150, 
      height: 45,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? primaryColor : Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
                  icon,
                  color: isSelected ? Colors.white : secondary,
                  size: 20,
                ) ,
        label: Text(
          text,
          style:  TextStyle(
            color: isSelected ? Colors.white : secondary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}