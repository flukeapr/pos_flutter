import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const ButtonIcon({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color secondary = Theme.of(context).colorScheme.secondary;
    final double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
      ),
      width: widthScreen * 0.15,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: secondary,
          size: 25,
        ),
      ),
    );
  }
}
