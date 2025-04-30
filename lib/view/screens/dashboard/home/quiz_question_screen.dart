import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({super.key});

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 70.h,
              child: SizedBox(
                height: 400.h,
                width: 375.w,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: TextView(
                            text: "This is one of the following number ${index + 1} question",
                            maxLines: 2,
                            fontSize: 20.spMin,
                            color: AppColors.kCharcoalBlack,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            children: List.generate(4, (index) {
                              return AnswerCard(index:index);
                            }),
                          ),
                        ),
                      ],
                    );
                  },
                  controller: _controller,
                  itemCount: 5,
                  onPageChanged: (value) {},
                  physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                    color: AppColors.kRoyalIndigo,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                        child: Row(
                          children: [
                            Icon(Icons.timer, size: 18.spMin, color: AppColors.kRoyalIndigo),
                            Gap(4),
                            TextView(
                              text: "14:49",
                              fontWeight: FontWeight.bold,
                              color: AppColors.kRoyalIndigo,
                            ),
                          ],
                        ),
                      ),
                      TextView(text: "Q 02", fontSize: 18.spMin, fontWeight: FontWeight.bold),
                      IconButton(
                        icon: Icon(Icons.grid_view, color: AppColors.kWhite),
                        onPressed: () {
                          //TODO:Navigate to the quiz progress screen, to see the progress of this particular quiz.
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultButtonMain(
                        borderRadius: 30.r,
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                        text: "Previous",
                        color: Colors.grey.shade200,
                        textColor: AppColors.kCharcoalBlack,
                        borderColor: AppColors.kRoyalIndigo,
                        fontWeight: FontWeight.w600,
                      ),
                      DefaultButtonMain(
                        borderRadius: 30.r,
                        text: "Next",
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 36.w),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [BoxShadow()],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
              child: TextView(
                text: String.fromCharCode(65 + index),
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(16),
            TextView(text: "Option A", fontSize: 16.spMin, color: AppColors.kCharcoalBlack),
          ],
        ),
      ),
    );
  }
}
