import 'package:flutter/material.dart';
import 'package:pos_flutter/screens/home/widget/listDrawer.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Drawer(
        backgroundColor: primaryColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Row(
                      children: [
                        Container( // flag icon aad pos
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Icon(
                            Icons.flag,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          "POS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container( // button lite header
                      width: 100,
                      height: 40,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {},
                          child: Text("LITE",
                              style: TextStyle(
                                  color: primaryColor, fontSize: 18))),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child:Column(
                    children: [
                      Text("John Doe", style: TextStyle(color: Colors.white,fontSize: 26),),

                    ],
                  ) ,
                )
                
              ]),
            ),
            
            Divider( // line
              color: Colors.grey.shade300,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            // group list drawer
            ListDrawer(title: 'Cashier', icon: Icons.smart_screen_outlined),
            ListDrawer(title: 'History Transaction', icon: Icons.paid_outlined),
            ListDrawer(title: 'Report', icon: Icons.pie_chart_outline),
            ListDrawer(title: 'Manage Store', icon: Icons.store_outlined),
            ListDrawer(title: 'Account', icon: Icons.person_outline),          
            ListDrawer(title: 'Support', icon: Icons.support_outlined),
            Spacer(),
            // group last login
            Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xFF2D7BD9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      icon: Icon(
                        Icons.cached,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text.rich(
                          
                          TextSpan(
                           children: [
                            TextSpan(
                              text: "Last login:",
                              style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                             TextSpan(
                              text: "\nMonday, July 01, 2020\n(12.00 AM)",
                              style: TextStyle(color: Colors.white, fontSize: 14,),
                            )
                           ]
                          ),
                          
                        )
                        ),
                  ],
                )
                ),
                // button upgrade footer
            Container(
              color: Color(0xFF2D7BD9), //Color(0xFF2D7BD9)
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    minimumSize: Size(100, 10),
                  ),
                  onPressed: () {},
                  child: Text(
                    "UPGRADE TO PREMIUM",
                    style: TextStyle(color: primaryColor, fontSize: 22),
                  )),
            ),
          ],
        ),
      );
  }
}