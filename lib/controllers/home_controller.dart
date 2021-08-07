import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:gallery/models/album_model.dart';
import 'package:gallery/repositories/app_repository.dart';

class HomeController extends GetxController {
  final AppRepository? repository;

  HomeController({@required this.repository}) : assert(repository != null);

  TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxList<AlbumModel> albums = RxList<AlbumModel>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    _getListAlbum();
    super.onInit();
  }

  Future<void> addAlbum() async {
    isLoading.value = true;
    update();

    final album = AlbumModel(title: textController.text);
    await repository!.createAlbum(CreateAlbumRequest(album: album)).then(
      (response) {
        textController.text = '';
        isLoading.value = false;
        albums.add(response);
        update();
      },
    );
  }

  Future<void> _getListAlbum() async {
    isLoading.value = true;
    update();

    await repository!.listAlbums().then(
      (response) {
        isLoading.value = false;
        if(response.albums != null){
          albums.addAll(response.albums!);
        }
        update();
      },
    );
  }
}
