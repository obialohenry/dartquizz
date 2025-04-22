import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/view/components/custom_text.dart';
import 'package:dartquizz/view/components/gap.dart';
import 'package:dartquizz/view/components/image_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.kPrimaryGradientLavenderMist),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: // Add An Icon//
                    Gap(25),
                    Row(
                      children: [
                        //TODO: // Add An Icon//
                        Gap(5),
                        TextView(text: helloMate, color: AppColors.kWhite, fontSize: 10.spMin),
                      ],
                    ),
                    Gap(15),
                    TextView(
                      text: whatDoYouWantToLearnToday,
                      color: AppColors.kWhite,
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Container(
                  height: 500.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                    color: AppColors.kPaleLavender,
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [

                    ].map((item) {
                            return Container(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              margin: EdgeInsets.only(bottom: 12),
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.kWhite,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 1, child: ImageView.asset('url')),
                                  Gap(5),
                                  Expanded(flex: 2, child: Column())
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
