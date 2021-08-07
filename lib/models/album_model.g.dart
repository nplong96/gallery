// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return AlbumModel(
    id: json['id'] as String?,
    title: json['title'] as String?,
    productUrl: json['productUrl'] as String?,
    isWriteable: json['isWriteable'] as bool?,
    mediaItemsCount: json['mediaItemsCount'] as String?,
    coverPhotoBaseUrl: json['coverPhotoBaseUrl'] as String?,
    coverPhotoMediaItemId: json['coverPhotoMediaItemId'] as String?,
  );
}

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'productUrl': instance.productUrl,
      'isWriteable': instance.isWriteable,
      'mediaItemsCount': instance.mediaItemsCount,
      'coverPhotoBaseUrl': instance.coverPhotoBaseUrl,
      'coverPhotoMediaItemId': instance.coverPhotoMediaItemId,
    };

CreateAlbumRequest _$CreateAlbumRequestFromJson(Map<String, dynamic> json) {
  return CreateAlbumRequest(
    album: AlbumModel.fromJson(json['album'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateAlbumRequestToJson(CreateAlbumRequest instance) =>
    <String, dynamic>{
      'album': instance.album,
    };

ListAlbumsResponse _$ListAlbumsResponseFromJson(Map<String, dynamic> json) {
  return ListAlbumsResponse(
    albums: (json['albums'] as List<dynamic>?)
        ?.map((e) => AlbumModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextPageToken: json['nextPageToken'] as String?,
  );
}

Map<String, dynamic> _$ListAlbumsResponseToJson(ListAlbumsResponse instance) =>
    <String, dynamic>{
      'albums': instance.albums,
      'nextPageToken': instance.nextPageToken,
    };
