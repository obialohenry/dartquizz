import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.kWhisperGray,
       body: Center(child: TextView(text: "Coming Soon",  fontWeight: FontWeight.bold,color:Colors.black,
                  fontSize: 24.spMin,),),
    );
  }
}