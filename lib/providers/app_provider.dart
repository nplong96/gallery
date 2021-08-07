import 'dart:io';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'package:gallery/models/media_model.dart';
import 'package:gallery/models/album_model.dart';
import 'package:gallery/controllers/login_controller.dart';

class AppProvider extends GetConnect {
  final Future<Map<String, String>> _authHeaders =
      LoginController.to.account!.authHeaders;

  Future<AlbumModel> createAlbum(CreateAlbumRequest request) async {
    final response = await http.post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/albums'),
      body: jsonEncode(request),
      headers: await _authHeaders,
    );

    return AlbumModel.fromJson(jsonDecode(response.body));
  }

  Future<AlbumModel> getAlbum(String albumId) async {
    final response = await http.get(
        Uri.parse('https://photoslibrary.googleapis.com/v1/albums/$albumId'),
        headers: await _authHeaders);

    return AlbumModel.fromJson(jsonDecode(response.body));
  }

  Future<ListAlbumsResponse> listAlbums() async {
    final response = await http.get(
        Uri.parse('https://photoslibrary.googleapis.com/v1/albums?'
            'pageSize=50&excludeNonAppCreatedData=true'),
        headers: await _authHeaders);

    return ListAlbumsResponse.fromJson(jsonDecode(response.body));
  }

  Future<String> uploadMediaItem(File image) async {
    // Get the filename of the image
    final filename = path.basename(image.path);

    // Set up the headers required for this request.
    final headers = <String, String>{};
    headers.addAll(await _authHeaders);
    headers['Content-type'] = 'application/octet-stream';
    headers['X-Goog-Upload-Protocol'] = 'raw';
    headers['X-Goog-Upload-File-Name'] = filename;

    // Make the HTTP request to upload the image. The file is sent in the body.
    final response = await http.post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/uploads'),
      body: image.readAsBytesSync(),
      headers: await _authHeaders,
    );

    return response.body;
  }

  Future<SearchMediaItemsResponse> searchMediaItems(
      SearchMediaItemsRequest request) async {
    final response = await http.post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/mediaItems:search'),
      body: jsonEncode(request),
      headers: await _authHeaders,
    );

    return SearchMediaItemsResponse.fromJson(jsonDecode(response.body));
  }

  Future<BatchCreateMediaItemsResponse?> batchCreateMediaItems(
      BatchCreateMediaItemsRequest request) async {
    final response = await http.post(
        Uri.parse(
            'https://photoslibrary.googleapis.com/v1/mediaItems:batchCreate'),
        body: jsonEncode(request),
        headers: await _authHeaders);

    return BatchCreateMediaItemsResponse.fromJson(jsonDecode(response.body));
  }
}
