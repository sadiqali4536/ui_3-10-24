import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  int _selectedIndex = 0;
  //this is for bottom navigation bar

  Future<void> selectImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation bottem bar decleration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: _image == null
                              ? const NetworkImage(
                                  "https://th.bing.com/th/id/OIP.Zvs5IHgOO5kip7A32UwZJgHaHa?w=190&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7")
                              : FileImage(_image!) as ImageProvider,
                        ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          right: 20,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Change Profile Picture"),
                                    actions: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  selectImage(
                                                      ImageSource.camera);
                                                },
                                                child: const Text("Take Photo"),
                                              ),
                                            ),
                                            Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  selectImage(
                                                      ImageSource.gallery);
                                                },
                                                child: const Text(
                                                    "Choose Photo"),
                                              ),
                                            ),
                                            Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    _image = null;
                                                  });
                                                },
                                                child: const Text(
                                                    "Delete Photo"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "sadiq",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text("sadiq@gmail.com"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black),
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
