
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/chat/presentation/screens/chat_list_screen/chat_list_screen.dart';
import 'package:dating_app/feature/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Screen2(),
    Screen3(),
    ChatListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: BottomNavigationBar(

            currentIndex: selectedIndex,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red,
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye_outlined), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.comment), label: 'Home'),
            ]),
        body: screens[selectedIndex] ,
      ),
    );
  }
}
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text("Screen 1"),),
    );
  }
}
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Center(child: Text("Screen 2"),),
    );
  }
}
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Center(child: Text("Screen 3"),),
    );
  }
}
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Center(child: Text("Screen 4"),),
    );
  }
}

