import 'package:dating_app/core/cubit/app_cubit.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomNavigation extends StatefulWidget {
  
 final UserModel user;
 ButtomNavigation({super.key, required this.user});

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: BlocProvider.of<AppCubit>(context).selectedIndex,
                onTap: (int index) {
                  AppCubit.get(context).changeButton(index);
                  // setState(() {
                  //   selectedIndex = index;
                  // });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.red,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.remove_red_eye_outlined),
                      label: 'views'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'likes'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.comment), label: 'chats'),
                ]),
            body: cubit.screens[cubit.selectedIndex],
          ),
        );
      },
    );
  }
}
