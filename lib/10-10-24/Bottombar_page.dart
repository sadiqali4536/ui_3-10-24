import 'package:flutter/material.dart';
import 'package:seat_booking/10-10-24/home.dart';
import 'package:seat_booking/10-10-24/settings_page.dart';

class BottombarPage extends StatefulWidget {
  const BottombarPage({super.key});

  @override
  State<BottombarPage> createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
  Home(),SettingsPage()
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    
    );
  }
}
