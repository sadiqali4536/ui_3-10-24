import 'package:flutter/material.dart';
import 'package:seat_booking/10-10-24/drawer_widget.dart';
import 'package:seat_booking/10-10-24/settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
      void _onDrawerItemTapped(String item, BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

@override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      drawer:DrawerWidget(
        ontap1:()=> _onDrawerItemTapped("Tab Section",context),
        ontap2:(){
          Navigator.push(context,MaterialPageRoute(builder: (_)=>SettingsPage()));
        },
        ontap3:()=>_onDrawerItemTapped("About",context) ,
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('Home Tab Content')),
          Center(child: Text('Tab 2 Content')),
          Center(child: Text('Tab 3 Content')),
        ],
      ),
    );
  }
}
