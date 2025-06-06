import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:dartquizz/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        isGitHubProfile: true,
                        title: myGitHub,
                        onTap: () {
                          UrlLacncher().launchGitHubLink();
                        },
                      ),
                      ProfileDetailItem(
                        icon: Icons.download,
                        title: downloadSourceCode,
                        onTap: () {},
                      ),
                      ProfileDetailItem(
                        icon: Icons.contact_mail,
                        title: contactMe,
                        onTap: () {
                          UrlLacncher().makePhoneCall("08136496931");
                        },
                      ),
                      ProfileDetailItem(
                        icon: Icons.language,
                        title: web,
                        onTap: () {
                          UrlLacncher().openWhatsApp("08120052669");
                        },
                      ),
                      ProfileDetailItem(
                        icon: Icons.mail,
                        title: email,
                        onTap: () {
                          UrlLacncher().sendEmail("obilaorchisomebi123@gmail.com");
                        },
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

class ProfileDetailItem extends StatelessWidget {
  const ProfileDetailItem({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
    this.isGitHubProfile = false,
  });
  final VoidCallback onTap;
  final String title;
  final IconData? icon;
  final bool isGitHubProfile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              isGitHubProfile
                  ? FaIcon(FontAwesomeIcons.github, color: AppColors.kRoyalIndigo)
                  : Icon(icon, color: AppColors.kRoyalIndigo),
          title: TextView(text: title, fontSize: 16.spMin, color: AppColors.kCharcoalBlack),
          trailing: Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        Divider(height: 1),
      ],
    );
  }
}
