import 'package:flutter/material.dart';
import 'package:gallery/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  GoogleSignInAccount? account;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'profile',
      'https://www.googleapis.com/auth/photoslibrary',
      'https://www.googleapis.com/auth/photoslibrary.sharing'
    ],
  );

  Future<void> onSingIn() async {
    account = await _googleSignIn.signIn();
    if (account != null) {
      Get.off(HomePage());
    } else {
      Get.snackbar(
        "Error",
        "Can not sign in",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
        backgroundColor: Colors.white,
        borderColor: Colors.red,
        borderWidth: 1,
        duration: Duration(seconds: 2),
      );
    }
  }
}
