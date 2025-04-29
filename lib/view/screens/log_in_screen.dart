
import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.kIndigoOcean),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
                  onPressed: () => navigateBack(context),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.book, size: 60, color: AppColors.kRoyalIndigo),
                      ),
                      SizedBox(height: 24),
                      TextView(text: learnWithQuizzes, color: Colors.white70, fontSize: 16),
                      Gap(48),

                      DefaultButtonIconMain(
                        width: MediaQuery.of(context).size.width * 0.8,
                        borderRadius: 30.r,
                        imageIcon: Icon(Icons.g_mobiledata, size: 24),
                        text: signInWithGoogle,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhite,
                        textColor: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
