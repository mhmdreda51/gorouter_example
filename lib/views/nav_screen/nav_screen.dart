import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import 'nav_screen_cubit.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavScreenCubit(navigationShell),
      child: BlocBuilder<NavScreenCubit, NavScreenState>(
        builder: (context, state) {
          final cubit = NavScreenCubit.get(context);
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: SlidingClippedNavBar(
              backgroundColor: Colors.white,
              onButtonPressed: cubit.onChangeIndex,
              iconSize: 30,
              activeColor: Colors.black,
              selectedIndex: cubit.selectedIndex,
              barItems: [
                BarItem(
                  icon: Icons.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: Icons.settings,
                  title: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
