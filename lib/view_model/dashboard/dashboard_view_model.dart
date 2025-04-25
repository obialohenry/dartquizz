import 'package:dartquizz/src/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModel = ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  final List<Widget> _dashboardScreen = [HomeScreen(), ProgressScreen(), ProfileScreen()];
  List<Widget> get dashboardScreen => _dashboardScreen;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void switchScreens(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
