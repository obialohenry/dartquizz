// import 'package:crypto_dart/crypto_dart.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dartquizz/src/model.dart';
import 'package:dartquizz/src/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  // final String key = dotenv.env['EN_KEY_AES'] ?? ""; // Your secret key for AES encryption
  saveAccessToken(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", accessToken);
    logger.i("saved accessToken");
  }

  saveEmailVerificationStatus(bool isVerified) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('emailIsVerified', isVerified);
    logger.i("Saved email verification status");
  }

  saveAppTme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("firstTimeOnApp", false);
    logger.i("saved first time on app, nahh😂");
  }

  saveUserSignInStatusToLocalStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isSignedIn", true);
    logger.i("User has signed in.");
  }

  saveAccountIDSubacriptionStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("accountID subscribed", true);
    logger.i("Event subscription successfull");
  }

  saveUserEmail(String email) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", email);
    logger.i("Saved $email successfully to local storage");
  }

  // saveUserPassword(String password) async {
  //   // Convert the key to bytes if needed
  //   final keyBytes = utf8.encode(key);

  //   // Encrypt the password
  //   final encryptedBytes = CryptoDart.AES.encrypt(password, keyBytes);

  //   // Encode encrypted bytes to a base64 string before storing
  //   final base64Password = base64.encode(encryptedBytes.cipherText);
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString(
  //     "Password",
  //     base64Password,
  //   );
  //   logger.i("saved Password");
  // }

  // getUserPassword() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   final encryptedPassword = sharedPreferences.getString("Password");
  //   if (encryptedPassword == null) return null;

  //   // Decode the base64 string to get the original encrypted bytes
  //   final encryptedBytes = base64.decode(encryptedPassword);

  //   // Decrypt the bytes (ensure the key is in the correct format)
  //   final decryptedBytes =
  //       CryptoDart.AES.decrypt(encryptedBytes, utf8.encode(key)); // Use key as bytes

  //   // Convert decrypted bytes back to a String

  //   // log(utf8.decode(decryptedBytes), name: "Decrypted Password");
  //   DummyData.password = utf8.decode(decryptedBytes);
  //   notifyListeners();
  //   logger.i("get Password ${DummyData.password}");
  // }

  saveRefreshToken(refreshToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("refreshToken", refreshToken);
    logger.i("saved refreshToken");
  }

  // saveUserDetails(Account userDetails) async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   String userInfo = jsonEncode(userDetails.toJson());
  //   sharedPreferences.setString("userDetails", userInfo);
  //   logger.i("Saved $userInfo successfully to local storage");
  // }

  // Future<Account> getUserDetails() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   DummyData.userAccountDetails = sharedPreferences.getString("userDetails");
  //   final userInfo = jsonDecode(DummyData.userAccountDetails!);
  //   return Account.fromJson(userInfo);
  // }

  saveUserEncryptedPassword(String encryptedPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("encryptedPassword", encryptedPassword);
    logger.i("saved encrypted password $encryptedPassword");
  }

  saveisLoggedIn(bool isLoggedIn) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLoggedIn', isLoggedIn);
    logger.i("Saved user log in status");
  }

  // getAccessToken() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   DummyData.accessToken = sharedPreferences.getString("accessToken") ?? "";
  //   logger.i("get accessToken : ${DummyData.accessToken}");
  //   notifyListeners();
  // }

  // getRefreshToken() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   DummyData.refreshToken = sharedPreferences.getString("refreshToken") ?? "";
  //   logger.i("get refreshToken : ${DummyData.refreshToken}");
  //   notifyListeners();
  // }

  getUserEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.emailAddress = sharedPreferences.getString("Email");
    notifyListeners();
    logger.f("${DummyData.emailAddress} successfully gotten from local storage");
  }
}
