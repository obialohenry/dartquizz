import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        onTap: (value) =>
          dashboardProvider.switchScreens(value)
        ,
      ),
    );
  }
}
