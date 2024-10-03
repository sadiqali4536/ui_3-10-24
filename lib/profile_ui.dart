import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  List<String> tool = [
    "hobbies",
    "programmer",
    "skils"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 100, 155),
      appBar: AppBar(
        title: const Text(
          "PROFILE",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 12, 27),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 60,
                backgroundImage: NetworkImage(
                  "https://static.vecteezy.com/system/resources/previews/028/569/170/original/single-man-icon-people-icon-user-profile-symbol-person-symbol-businessman-stock-vector.jpg",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "sadiqali",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "flutter developer",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: ListView.builder(itemCount: tool.length,
                itemBuilder: (context,index){
                return  ListTile(title: Text(tool[index]),);
              }),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: const Text("Show Toast")),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Updated profile"),
                        ));
                      },
                      child: const Text("updated profile")),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
