import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel {
  String? id;
  String? title;
  String? productUrl;
  bool? isWriteable;
  String? mediaItemsCount;
  String? coverPhotoBaseUrl;
  String? coverPhotoMediaItemId;

  AlbumModel(
      {this.id,
      this.title,
      this.productUrl,
      this.isWriteable,
      this.mediaItemsCount,
      this.coverPhotoBaseUrl,
      this.coverPhotoMediaItemId});

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}

@JsonSerializable()
class CreateAlbumRequest {
  AlbumModel album;

  CreateAlbumRequest({required this.album});

  factory CreateAlbumRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAlbumRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAlbumRequestToJson(this);
}

@JsonSerializable()
class ListAlbumsResponse {
  List<AlbumModel>? albums;
  String? nextPageToken;

  ListAlbumsResponse({this.albums, this.nextPageToken});

  factory ListAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAlbumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListAlbumsResponseToJson(this);
}
