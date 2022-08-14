import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/view/add_video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              pageIndex = i;
            });
          },
          currentIndex: pageIndex,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: myRed,
          unselectedItemColor: Colors.white,
          items: [
            const BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 45,
                decoration: BoxDecoration(
                  color: myRed,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: "Messages",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
          ]),
      body: getPagesById(pageIndex),
    );
  }
}

Widget getPagesById(int index) {
  switch (index) {
    case 0:
      // Home
      return Container(child: const Text("He1lo"));
    case 1:
      return const AddVideoPage();
    case 2:
      return const AddVideoPage();
    case 3:
      return const AddVideoPage();
  }
  return Container(child: const Text("He1lo"));
}
