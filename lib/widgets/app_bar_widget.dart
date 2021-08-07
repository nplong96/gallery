import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:gallery/pages/login_page.dart';
import 'package:gallery/controllers/login_controller.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final String? title;
  final loginController = Get.find<LoginController>();

  AppBarWidget({Key? key, required this.hasBackButton, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: hasBackButton,
      titleSpacing: 0,
      leadingWidth: 30,
      backgroundColor: Colors.lightGreen,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _buildAvatar(),
            Expanded(
              child: Text(
                title ?? 'Photo Gallery',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            PopupMenuButton(
              onSelected: (value) async {
                await loginController.signOut();
                Get.offAll(() => LoginPage());
              },
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  height: 20,
                  child: Text('Log out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return loginController.account!.photoUrl != null
        ? Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(loginController.account!.photoUrl!),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: Text(
              loginController.account!.displayName![0],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
