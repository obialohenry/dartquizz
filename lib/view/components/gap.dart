import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  const Gap(this.size,{super.key});
final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension:size.spMin,
    );
  }
}