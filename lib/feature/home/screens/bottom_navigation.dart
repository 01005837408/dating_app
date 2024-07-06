import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/chat/screen/chat_list_screen.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_cubit.dart';
import 'package:dating_app/feature/home/screens/home_screen.dart';
import 'package:dating_app/feature/likes_screen/likes_screen.dart';
import 'package:dating_app/feature/viewProfile/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const ButtonNavigationView(),
    );
  }
}

class ButtonNavigationView extends StatelessWidget {
  const ButtonNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      ViewProfile(),
      const LikesScreen (),
      ChatListScreen(),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<HomeCubit, int>(
          builder: (context, selectedIndex) {
            return BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index) {
                context.read<HomeCubit>().updateIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.comment),
                  label: 'Chat',
                ),
              ],
            );
          },
        ),
        body: BlocBuilder<HomeCubit, int>(
          builder: (context, selectedIndex) {
            return screens[selectedIndex];
          },
        ),
      ),
    );
  }
}
