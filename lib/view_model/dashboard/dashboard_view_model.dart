import 'package:dartquizz/src/model.dart';
import 'package:dartquizz/src/screens.dart';
import 'package:dartquizz/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dashboardViewModel = ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  checkUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.isSignedIn = sharedPreferences.getBool("isSignedIn") ?? false;
  }

  void checkUserSignedIn(context) {
    if (!DummyData.isSignedIn) {
      logInAlertDialog(context);
    } else {
      navigatePush(context, QuizQuestionScreen());
    }
  }

  final List<Widget> _dashboardScreen = [HomeScreen(), ProgressScreen(), ProfileScreen()];
  List<Widget> get dashboardScreen => _dashboardScreen;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void switchScreens(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
