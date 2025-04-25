
import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.kPrimaryGradientTwilightGlow),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(text: helloMate, color: Colors.white70),
                Gap(8),
                TextView(
                  text: whatWouldYouLikeToLearnToday,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.spMin,
                ),
              ],
            ),
            Gap(16),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  QuizzCard(
                    color: Colors.blue.withAlpha((0.9 * 255).toInt()),
                    cardIcon: Icon(Icons.science_outlined, size: 32, color: Colors.black),
                    title: "Physics",
                    description:
                        'Basic physics Multiple Choice Questions (MCQ) to practice basic physics quiz answers',
                  ),
                  Gap(16),
                  QuizzCard(
                    color: Colors.blue.withAlpha((0.9 * 255).toInt()),
                    cardIcon: Icon(Icons.science_outlined, size: 32, color: Colors.black),
                    title: "Physics",
                    description:
                        'Basic physics Multiple Choice Questions (MCQ) to practice basic physics quiz answers',
                  ),
                  Gap(16),
                  QuizzCard(
                    color: Colors.blue.withAlpha((0.9 * 255).toInt()),
                    cardIcon: Icon(Icons.science_outlined, size: 32, color: Colors.black),
                    title: "Physics",
                    description:
                        'Basic physics Multiple Choice Questions (MCQ) to practice basic physics quiz answers',
                  ),
                  Gap(16),
                  QuizzCard(
                    color: Colors.blue.withAlpha((0.9 * 255).toInt()),
                    cardIcon: Icon(Icons.science_outlined, size: 32, color: Colors.black),
                    title: "Physics",
                    description:
                        'Basic physics Multiple Choice Questions (MCQ) to practice basic physics quiz answers',
                  ),
                  Gap(16),
                  QuizzCard(
                    color: Colors.blue.withAlpha((0.9 * 255).toInt()),
                    cardIcon: Icon(Icons.science_outlined, size: 32, color: Colors.black),
                    title: "Physics",
                    description:
                        'Basic physics Multiple Choice Questions (MCQ) to practice basic physics quiz answers',
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

class QuizzCard extends StatelessWidget {
  const QuizzCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    // required this.cardIconColor,
    required this.cardIcon,
  });
  final String title;
  final Color color;
  final String description;
  // final Color cardIconColor;
  final Widget cardIcon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      color: AppColors.kWhite,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
              child: Center(child: cardIcon),
            ),
            Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: title,
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kCharcoalBlack,
                  ),
                  Gap(4),
                  TextView(
                    text: description,
                    maxLines: 2,
                    fontSize: 14.spMin,
                    textOverflow: TextOverflow.ellipsis,
                    color: AppColors.kSteelGray,
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.quiz, size: 16.spMin, color: Colors.grey),
                          Gap(4),
                          TextView(text: fiveQuizzes, fontSize: 12.spMin, color: Colors.grey),
                        ],
                      ),
                      Gap(16),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16.spMin, color: Colors.grey),
                          Gap(4),
                          TextView(text: fifteenMins, fontSize: 12.spMin, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}
