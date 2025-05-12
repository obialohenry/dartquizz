import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/model.dart';
import 'package:dartquizz/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    final homeProvider = ref.watch(homeViewModel);
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      appBar: AppBar(
        backgroundColor: AppColors.kRoyalIndigo,
        title: TextView(text: learn, fontWeight: FontWeight.bold, fontSize: 20.spMin),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: AppColors.kWhite),
          ),
        ],
      ),
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
                children:
                    List.generate(homeProvider.quizzes.length, (index) {
                      DartQuizResponseModel quiz = homeProvider.quizzes[index];
                      return QuizzCard(
                        color: Colors.blue.withAlpha((0.9 * 255).toInt()),
                        onTap: () {
                          dashboardProvider.checkUserSignedIn(context);
                        },
                        time: homeProvider.quizTime[index] ?? "ERROR",
                        cardIcon: FaIcon(
                          FontAwesomeIcons.dartLang,
                          size: 32.0.spMin,
                          color: Colors.black,
                        ),
                        title: quiz.title ?? "ERROR",
                        description: quiz.description ?? "ERROR",
                      );
                    }).toList(),
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
    required this.onTap,
    required this.time,
  });
  final String title;
  final Color color;
  final String description;
  // final Color cardIconColor;
  final Widget cardIcon;
  final VoidCallback onTap;
  final String time;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        color: AppColors.kWhite,
        margin: EdgeInsets.only(bottom: 16.h),
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
                            TextView(text: tenQuizzes, fontSize: 12.spMin, color: Colors.grey),
                          ],
                        ),
                        Gap(16),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16.spMin, color: Colors.grey),
                            Gap(4),
                            TextView(text: "$time mins", fontSize: 12.spMin, color: Colors.grey),
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
      ),
    );
  }
}
