import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dashboardProvider = ref.read(dashboardViewModel);
    final homeProvider = ref.read(homeViewModel);
    dashboardProvider.checkUser();
    homeProvider.dartQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = ref.watch(dashboardViewModel);
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      body: dashboardProvider.dashboardScreen[dashboardProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: progress),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: profile),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.kCosmicBlue,
        currentIndex: dashboardProvider.currentIndex,
        onTap: (value) => dashboardProvider.switchScreens(value),
      ),
    );
  }
}
