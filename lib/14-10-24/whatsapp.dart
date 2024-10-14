import 'package:flutter/material.dart';

void main() {
  runApp(WhatsApp());
}

class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.green, fontSize: 25),
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: const Color.fromARGB(255, 229, 228, 228),
          labelColor: const Color.fromARGB(255, 4, 4, 4),
        ),
      ),
      home: WhatsAppHomeScreen(),
    );
  }
}

class WhatsAppHomeScreen extends StatefulWidget {
  @override
  _WhatsAppHomeScreenState createState() => _WhatsAppHomeScreenState();
}

class _WhatsAppHomeScreenState extends State<WhatsAppHomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedBottomNavIndex = 0;
  late TabController _tabController;

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
        actions: [
          Icon(Icons.qr_code_scanner_sharp),
          SizedBox(width: 20),
          Icon(Icons.camera_alt_outlined),
          PopupMenuButton(
            onSelected: (value) {
              if (value == "profile") {
                // Add desired output for profile
              } else if (value == "settings") {
                // Add desired output for settings
              } else if (value == "logout") {
                // Add desired output for logout
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: "profile",
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.person),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "settings",
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.settings),
                    ),
                    const Text(
                      'Settings',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "logout",
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.logout),
                    ),
                    const Text(
                      'Logout',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        title: Text('WhatsApp'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 476,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",
                    fillColor: Colors.grey[300],
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              
              Padding(
                padding:  EdgeInsets.only(left:8.0),
                child: Row(
                 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ElevatedButton(onPressed: (){}, child:Text("All",),style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey[200])),),
                (Padding(padding: EdgeInsets.only(left: 8.0))),
                ElevatedButton(onPressed: (){}, child:Text("Unread"),style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey[200]))),
                (Padding(padding: EdgeInsets.only(left: 8.0))),
                ElevatedButton(onPressed: (){}, child:Text("Favourites"),style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey[200]))),
                (Padding(padding: EdgeInsets.only(left: 8.0))),
                ElevatedButton(onPressed: (){}, child:Text("Group"),style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey[200]))),
                (Padding(padding: EdgeInsets.only(left: 8.0))),
                ],),
              ),
            
              
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text('person ${index + 1}'),
                    subtitle: Text('chats'),
                    trailing: Text('10:33 AM'),
                  );
                  
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  8.0),
                    child: Divider(
               
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _selectedBottomNavIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add_comment, color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 6, 204, 105),
            )
          : null,
    );
  }
}
