import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

Future<dynamic> logInAlertDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.kWhisperGray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: hi,
              fontSize: 18.spMin,
              fontWeight: FontWeight.bold,
              color: AppColors.kCharcoalBlack,
            ),
            Gap(4),
            TextView(
              text: pleaseLoginBeforeStartingTheQuiz,
              fontSize: 14.spMin,
              color: AppColors.kSteelGray,
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.bottomRight,
            child: TextView(
              text: alright,
              color: AppColors.kRoyalIndigo,
              fontSize: 16.spMin,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );
    },
  );
}
