import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optilife/core/navigation/routes.dart';
import 'package:optilife/features/home/home_screen.dart';
import 'package:optilife/features/signup/signup_screen.dart';
import 'package:optilife/features/user_account/user_account.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar> {
  int selectedPageIndex = 0;
  late PageController _pageController;

  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageTap(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  List pages = [
    const HomeScreen(),
    SignupScreen(),
    const UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.grey.shade300,
      elevation: 10.0,
      selectedIndex: 0,
      onDestinationSelected: onPageTap,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(icon: Icon(Icons.food_bank), label: 'Recipes'),
        NavigationDestination(
            icon: Icon(Icons.accessibility_rounded), label: 'Account'),
      ],
    );
  }
}
