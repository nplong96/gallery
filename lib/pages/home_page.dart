import 'package:gallery/pages/album_detail_page.dart';
import 'package:gallery/widgets/text_input_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:gallery/widgets/app_bar_widget.dart';
import 'package:gallery/providers/app_provider.dart';
import 'package:gallery/controllers/home_controller.dart';
import 'package:gallery/repositories/app_repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GetBuilder<HomeController>(
        init: Get.put(
          HomeController(
            repository: AppRepository(
              apiClient: AppProvider(),
            ),
          ),
        ),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarWidget(
              hasBackButton: false,
            ),
            body: controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildAlbumList(controller),
                        _buildButtonCreate(controller),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildButtonCreate(HomeController controller) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.dialog(
            _buildAddAlbumForm(controller),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(
            top: 50,
            bottom: 20,
          ),
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
              Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              Text(
                'Create a album',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddAlbumForm(HomeController controller) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Album name',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: TextInputWidget(
                    textController: controller.textController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.back();
                          controller.addAlbum();
                        }
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumList(HomeController controller) {
    return Wrap(
      spacing: 25,
      children: controller.albums
          .map<Widget>(
            (item) => GestureDetector(
              onTap: () {
                Get.to(
                  () => AlbumDetailPage(),
                  arguments: item,
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/album.png",
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    item.title!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
