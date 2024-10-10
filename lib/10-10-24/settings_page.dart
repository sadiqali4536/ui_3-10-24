import 'package:flutter/material.dart';
import 'package:seat_booking/10-10-24/drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
        void _onDrawerItemTapped(String item, BuildContext context) {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerWidget(
        ontap1: () => _onDrawerItemTapped('Tab Section', context),
        ontap2: () => _onDrawerItemTapped('Settings', context),
        ontap3: () => _onDrawerItemTapped('About', context),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://thumbs.dreamstime.com/b/unknown-male-avatar-profile-image-businessman-vector-unknown-male-avatar-profile-image-businessman-vector-profile-179373829.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'sadiqali',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}