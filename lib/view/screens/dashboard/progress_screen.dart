import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      appBar: AppBar(
        backgroundColor: AppColors.kRoyalIndigo,
        leading: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
        title: TextView(text: "0 out of 5 answered", fontWeight: FontWeight.w800),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timer, size: 24.spMin, color: AppColors.kRoyalIndigo),
              Gap(8),
              TextView(
                text: "14:56 Remaining",
                color: AppColors.kRoyalIndigo,
                fontSize: 18.spMin,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Gap(32),
          Wrap(
            spacing: 8.w,
            children: List.generate(5, (index) {
              return QuestionNumberButton(questionNumber: (index + 1));
            }),
          ),
        ],
      ),
    );
  }
}

class QuestionNumberButton extends StatelessWidget {
  const QuestionNumberButton({super.key, required this.questionNumber, this.isAnswered = false});
  final int questionNumber;
  final bool isAnswered;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 56,
      height: 56.h,
      // margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color:
            isAnswered ? AppColors.kRoyalIndigo.withAlpha((255 * 0.1).toInt()) : AppColors.kWhite,
        border: Border.all(
          color: isAnswered ? AppColors.kRoyalIndigo : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: TextView(
        text: questionNumber.toString(),
        fontSize: 18.spMin,
        fontWeight: FontWeight.bold,
        color: isAnswered ? AppColors.kRoyalIndigo : Colors.grey,
      ),
    );
  }
}
