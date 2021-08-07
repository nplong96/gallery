import 'dart:io';
import 'package:flutter/material.dart';

import 'package:gallery/models/album_model.dart';
import 'package:gallery/models/media_model.dart';
import 'package:gallery/providers/app_provider.dart';

class AppRepository {
  final AppProvider? apiClient;

  AppRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<AlbumModel> createAlbum(CreateAlbumRequest request) async {
    return await apiClient!.createAlbum(request);
  }

  Future<AlbumModel> getAlbum(String albumId) async {
    return await apiClient!.getAlbum(albumId);
  }

  Future<ListAlbumsResponse> listAlbums() async {
    return await apiClient!.listAlbums();
  }

  Future<String> uploadMediaItem(File image) async {
    return await apiClient!.uploadMediaItem(image);
  }

  Future<BatchCreateMediaItemsResponse?> batchCreateMediaItems(
      BatchCreateMediaItemsRequest request) async {
    return await apiClient!.batchCreateMediaItems(request);
  }

  Future<SearchMediaItemsResponse> searchMediaItems(
      SearchMediaItemsRequest request) async {
    return apiClient!.searchMediaItems(request);
  }
}
