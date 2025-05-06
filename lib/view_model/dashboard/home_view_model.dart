import 'dart:convert';

import 'package:dartquizz/src/model.dart';
import 'package:dartquizz/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = ChangeNotifierProvider((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  List<DartQuizResponseModel> _quizzes = [];
  List<DartQuizResponseModel> get quizzes => _quizzes;

 final  Map<int, String> _quizTime = {0: "15", 1: "20", 2: "25", 3: "20", 4: "25"};
  Map<int, String> get quizTime => _quizTime;
  //A method to  get the list of dart quizzes stored in a local json file,and store it in a List variable.
  Future<void> dartQuizzes() async {
    try {
      // await Future.delayed(Duration(milliseconds: 3));
      final stringFormat = await rootBundle.loadString('assets/json/dart_quiz.json');
      final decodedData = jsonDecode(stringFormat);
      _quizzes =
          (decodedData as List).map((element) => DartQuizResponseModel.fromJson(element)).toList();

      logger.i("Dart quiz List: $_quizzes");
    } catch (e, s) {
      logger
        ..i("CHECK ERROR LOGS")
        ..d(s)
        ..e(e);
    }
  }
}
