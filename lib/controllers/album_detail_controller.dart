import 'dart:io';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:gallery/models/album_model.dart';
import 'package:gallery/models/media_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery/repositories/app_repository.dart';

class AlbumDetailController extends GetxController {
  final AppRepository? repository;

  AlbumDetailController({@required this.repository})
      : assert(repository != null);

  RxList<MediaItem> images = RxList<MediaItem>();
  final ImagePicker _picker = ImagePicker();
  AlbumModel? argument;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    argument = Get.arguments;
    _getImage();
    super.onInit();
  }

  Future<void> _getImage() async {
    isLoading.value = true;
    update();
    await repository!
        .searchMediaItems(SearchMediaItemsRequest(albumId: argument!.id))
        .then(
      (response) {
        isLoading.value = false;
        if (response.mediaItems != null) {
          images.addAll(response.mediaItems!);
        }
        update();
      },
    );
  }

  Future<void> onAddImage() async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    isLoading.value = true;
    update();
    final pickedFile = File(image.path);
    await repository!.uploadMediaItem(pickedFile).then(
      (response) async {
        final request =
        BatchCreateMediaItemsRequest.inAlbum(response, argument!.id, "");
        await repository!.batchCreateMediaItems(request);
        _getImage();
        update();
      },
    );
  }
}
