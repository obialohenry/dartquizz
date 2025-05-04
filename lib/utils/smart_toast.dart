import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/components.dart';

void showToast({

  required String msg,
  bool isError = false,
  bool isNeutralMessage = false,
  VoidCallback? onDismiss,
}) async {
  const toastDuration = Duration(seconds: 2);
  var cancelFunc = BotToast.showAttachedWidget(
    target: const Offset(-16, -16),
    verticalOffset: 10.0,
    horizontalOffset: 4.0,
   
    duration: toastDuration,
    animationDuration: const Duration(seconds: 2),
    preferDirection: PreferDirection.topRight,
    onlyOne: false,
    attachedBuilder: (cancel) {
      return AlertBody(cancel: cancel, msg: msg, isError: isError);
    },
  );
  Future.delayed(toastDuration).then((_) {
    cancelFunc();
    onDismiss?.call();
  });
}

class AlertBody extends StatefulWidget {
  final VoidCallback cancel;
  final String msg;
  final bool isError;
final bool isNeutralMessage;
  const AlertBody(
      {super.key,
      required this.cancel,
      required this.msg,
      this.isError = false,
      this.isNeutralMessage = false});

  @override
  State<AlertBody> createState() => _AlertBodyState();
}

class _AlertBodyState extends State<AlertBody> with SingleTickerProviderStateMixin {


  AnimationController? _animationController;
  Animation<double>? animation;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    init();

    super.didChangeDependencies();
  }

  init() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 5.0, end: 0.0).animate(_animationController!)
      ..addListener(() {
        initAnt();
      });

    _animationController!.forward();
  }

  Future<void> initAnt() async {
    setState(() {
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
            color: widget.isNeutralMessage
                ? Colors.grey.shade200 // Light gray for neutral notifications
                : widget.isError
                    ? AppColors.kFlameOrange
                    : AppColors.kRoyalIndigo,
            border: Border.all(
                color: widget.isNeutralMessage
                    ? Colors.grey.shade400.withAlpha((255 * 0.7).toInt()) // Slightly darker gray for border
                    : widget.isError
                        ? AppColors.kFlameOrange.withAlpha((255 * 0.7).toInt())
                        : AppColors.kRoyalIndigo.withAlpha((255 * 0.7).toInt()),
                width: 3),
            borderRadius: BorderRadius.circular(15.r)),
        height: 75.h,
        width: 360.w,
        child: Stack(
         
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.isError ? AppColors.kFlameOrange.withAlpha((255 * 0.4).toInt()) : AppColors.kRoyalIndigo,
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: widget.cancel,
                         
                          icon: Icon(
                            widget.isError ? Icons.close : Icons.check,
                            size: 15.spMin,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                      const Gap(7),
                      SizedBox(
                        width: 250.w,
                        child: TextView(
                          text: widget.msg,
                          color: AppColors.kWhite,
                          fontSize: 14.spMin,
                          maxLines: 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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