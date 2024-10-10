import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function() ontap1;
  Function()? ontap2;
  Function() ontap3;
   DrawerWidget({super.key,required this.ontap1, this.ontap2,required this.ontap3});



  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.redAccent),
              child: Text(
                "Drawer Header",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text("Tab Section"),
              onTap:ontap1,
            ),
            ListTile(
              title: Text("settings"),
              onTap: ontap2,
              
            ),
            ListTile(
              title: Text("About"),
              onTap:ontap3,
            ),
          ],
        ),
      );
  }
}