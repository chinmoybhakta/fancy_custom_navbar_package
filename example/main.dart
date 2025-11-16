import 'package:fancy_custom_navbar/fancy_custom_navbar.dart';
import 'package:flutter/material.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Screen1(),
      Screen2(),
      Screen3(),
      Screen4(),
    ];
    return MaterialApp(
      home: Scaffold(
        body: pages[selectedScreen],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BottomNavigation(
          currentIndex: selectedScreen,
          onTap: (newIndex) {
            setState(() {
              selectedScreen = newIndex;
            });
          },
          items: [
            NavBarItem(label: "Home", icon: Icons.home),
            NavBarItem(label: "Love", icon: Icons.favorite),
            NavBarItem(label: "Profile", icon: Icons.person),
            NavBarItem(label: "setting", icon: Icons.settings),
          ],
          selectedColor: Colors.yellow,
          unselectedColor: Colors.yellow,
          innerContainerColor: Colors.purpleAccent,
          outerContainerColor: Colors.purple,
        ),
      ),
    );
  }
}