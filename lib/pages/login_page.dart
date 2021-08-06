import 'package:flutter/material.dart';
import 'package:gallery/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
              bottom: 50,
            ),
            child: Image.asset(
              "assets/icons/ic_gg_photo.png",
              height: 80,
            ),
          ),
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Please sign in to use the app!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
          onTap: () {
            loginController.onSingIn();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/ic_gg.png",
                  height: 25,
                ),
                SizedBox(width: 10),
                Text(
                  'Log in with Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
  }
}
