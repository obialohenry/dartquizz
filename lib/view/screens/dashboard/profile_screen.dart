import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/utils.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhisperGray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => navigateBack(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.kRoyalIndigo),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.kRoyalIndigo,
                child: TextView(text: "S", fontSize: 36.spMin, fontWeight: FontWeight.bold),
              ),
              Gap(16),
              TextView(
                text: sisu,
                fontSize: 24.spMin,
                fontWeight: FontWeight.bold,
                color: AppColors.kCharcoalBlack,
              ),
              Gap(20),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProfileDetailItem(
                        icon: Icons.gif_box, //TODO:change to github icon.
                        title: myGitHub,
                        onTap: () {},
                    ),
                      ProfileDetailItem(
                      icon: Icons.download,
                        title: downloadSourceCode,
                        onTap: () {},
                    ),
                      ProfileDetailItem(
                      icon: Icons.contact_mail,
                      title: contactMe, onTap: () {},
                    ),
                      ProfileDetailItem(
                      icon: Icons.language,
                      title: web, onTap: () {},
                    ),
                      ProfileDetailItem(icon: Icons.mail, title: email, onTap: () {}),
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

class ProfileDetailItem extends StatelessWidget {
  const ProfileDetailItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.kRoyalIndigo),
          title: TextView(text: title, fontSize: 16.spMin, color: AppColors.kCharcoalBlack),
          trailing: Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        Divider(height: 1),
      ],
    );
  }
}
