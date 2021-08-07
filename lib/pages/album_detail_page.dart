import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:gallery/providers/app_provider.dart';
import 'package:gallery/widgets/app_bar_widget.dart';
import 'package:gallery/repositories/app_repository.dart';
import 'package:gallery/controllers/album_detail_controller.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlbumDetailController>(
      init: Get.put(
        AlbumDetailController(
          repository: AppRepository(
            apiClient: AppProvider(),
          ),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            hasBackButton: true,
            title: controller.argument!.title,
          ),
          body: controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.images.isEmpty
                  ? Center(
                      child: Text(
                        'Upload your images',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : _buildImages(controller),
          floatingActionButton: _buildAddButton(controller),
        );
      },
    );
  }

  Widget _buildImages(AlbumDetailController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 25,
            runSpacing: 25,
            children: controller.images
                .map<Widget>(
                  (item) => Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(item.baseUrl!),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton(AlbumDetailController controller) {
    return GestureDetector(
      onTap: () {
        controller.onAddImage();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightGreen,
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
