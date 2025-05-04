import 'package:dartquizz/src/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLacncher {
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      showToast(msg: "Could not launch $phoneUri", isError: true);
     
    }
  }

  Future<void> sendEmail(String email, {String? subject, String? body}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          Uri(
            queryParameters: {
              if (subject != null) 'subject': subject,
              if (body != null) 'body': body,
            },
          ).query,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      showToast(msg: "Could not launch $emailUri", isError: true);
    }
  }

  Future<void> openWhatsApp(String phoneNumber, {String? message}) async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber,
      queryParameters: message != null ? {'text': message} : null,
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      showToast(msg: 'Could not open whatsapp number $phoneNumber', isError: true);
    }
  }

  Future<void> launchGitHubLink() async {
    final Uri gitHubUri = Uri(scheme: 'https', host: "github.com", path: "obialohenry");
    if (await canLaunchUrl(gitHubUri)) {
      await launchUrl(gitHubUri, mode: LaunchMode.externalApplication);
    } else {
      showToast(msg: "Could not launch $gitHubUri", isError: true);
      
    }
  }
}
