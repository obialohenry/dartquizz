import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                    color: AppColors.kRoyalIndigo,
                  ),
                  child: TextView(
                    text: "3 out of 5 are correct",
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(Icons.lightbulb, size: 80.spMin, color: AppColors.kRoyalIndigo),
                  Gap(24),
                  TextView(
                    text: congratulations,
                    color: AppColors.kRoyalIndigo,
                    fontSize: 24.spMin,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(8),
                  TextView(
                    text: "You have got 376.67 points",
                    fontSize: 16.spMin,
                    color: AppColors.kSteelGray,
                  ),
                  Gap(32),
                  TextView(
                    text: tapBelowQuestionNumberToViewAnswer,
                    fontSize: 14,
                    color: AppColors.kSteelGray,
                  ),
                  Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 8.w),
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color:
                              (index + 1) == 1 || (index + 1) == 3
                                  ? AppColors.kBrightCyan
                                  : AppColors.kFlameOrange,
                        ),
                        child: TextView(
                          text: "${index + 1}",
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
              ],
            ),
                       Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultButtonMain(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      borderRadius: 12.r,
                      color: AppColors.kSteelGray,
                      text: tryAgain,
                    ),
                  ),
                  Gap(16),
                   Expanded(
                    child: DefaultButtonMain(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      borderRadius: 12.r,
                      color: AppColors.kRoyalIndigo,
                      text: goHome,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
