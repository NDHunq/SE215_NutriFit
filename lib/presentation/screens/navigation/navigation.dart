import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/home/HomePage.dart';
import 'package:se215_nutrifit/presentation/screens/plan/planPage.dart';
import 'package:se215_nutrifit/presentation/screens/recipe/recipePage.dart';
import 'package:se215_nutrifit/presentation/screens/workout/workoutPage.dart';

class Navigation extends StatefulWidget {
  final int? tab;
  final int? userId;
  const Navigation({super.key, this.tab, this.userId});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int userId = 0;
  String userAvatar = "";
  Future<void> userID() async {}

  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.tab ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navigationBar(),
      body: [
        HomePage(),
        WorkoutPage(),
        RecipePage(),
        PlanPage(),
      ][currentPageIndex],
    );
  }

  Widget _navigationBar() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      height: 70, // Adjust height for better alignment
      backgroundColor: Colors.white,
      indicatorColor: Colors.transparent,
      labelBehavior:
          NavigationDestinationLabelBehavior.alwaysHide, // Hide labels
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: AppColors.xanh_ngoc_nhat,
            size: 30,
          ),
          icon: Icon(
            Icons.home,
            color: Colors.grey,
            size: 30,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.fitness_center,
            color: AppColors.xanh_ngoc_nhat,
            size: 30,
          ),
          icon: Icon(
            Icons.fitness_center,
            color: Colors.grey,
            size: 30,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.restaurant,
            color: AppColors.xanh_ngoc_nhat,
            size: 30,
          ),
          icon: Icon(
            Icons.restaurant,
            color: Colors.grey,
            size: 30,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.note_alt,
            color: AppColors.xanh_ngoc_nhat,
            size: 30,
          ),
          icon: Icon(
            Icons.note_alt,
            color: Colors.grey,
            size: 30,
          ),
          label: '',
        ),
      ],
      selectedIndex: currentPageIndex,
    );
  }
}
