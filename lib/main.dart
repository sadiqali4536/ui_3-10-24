import 'package:flutter/material.dart';
import 'package:seat_booking/alert_dialoge/alert_box.dart';
import 'package:seat_booking/alert_dialoge/profile.dart';
import 'package:seat_booking/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "profile":(context)=>Profile(),
      },
      initialRoute: "profile",
      // home: const HomePage()
    );
  }
}

