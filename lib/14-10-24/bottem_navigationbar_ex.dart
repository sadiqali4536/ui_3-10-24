
import 'package:flutter/material.dart';
import 'package:seat_booking/14-10-24/whatsapp.dart';

class BottomNavigationbarEx extends StatefulWidget {
  const BottomNavigationbarEx({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbarEx> createState() => _BottomNavigationbarExState();
}

class _BottomNavigationbarExState extends State<BottomNavigationbarEx> {
  int _selectedBottomNavIndex = 0; 

 
  final List<Widget> _bottomNavScreens = [
    WhatsApp(), 
    Center(child: Text("Updates"),),
    Center(child: Text("Communities"),),
    Center(child:Text("Calls") ,)
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedBottomNavIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavScreens[_selectedBottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 11, 11, 11),
        currentIndex: _selectedBottomNavIndex,
        onTap: _onBottomNavTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: const Color.fromARGB(255, 26, 25, 25),),
            label: 'chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,color: const Color.fromARGB(255, 2, 2, 2),),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_sharp,size: 30,color: const Color.fromARGB(255, 2, 2, 2),),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined,color: const Color.fromARGB(255, 5, 5, 5),),
            label: 'Calls',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 11, 11, 11),
      ),
    
    );
  }
}

