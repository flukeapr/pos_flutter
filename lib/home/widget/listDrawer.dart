import 'package:flutter/material.dart';

class ListDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  const ListDrawer({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(width: 12),
            Icon(
              icon,
              color: Colors.white,
              size: 36,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
          ],
        ),
      ),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        Navigator.pop(context);
      },
    );
  }
}
