// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchCreateMediaItemsRequest _$BatchCreateMediaItemsRequestFromJson(
    Map<String, dynamic> json) {
  return BatchCreateMediaItemsRequest(
    json['albumId'] as String?,
    (json['newMediaItems'] as List<dynamic>)
        .map((e) => NewMediaItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['albumPosition'] == null
        ? null
        : AlbumPosition.fromJson(json['albumPosition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchCreateMediaItemsRequestToJson(
        BatchCreateMediaItemsRequest instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'newMediaItems': instance.newMediaItems,
      'albumPosition': instance.albumPosition,
    };

NewMediaItem _$NewMediaItemFromJson(Map<String, dynamic> json) {
  return NewMediaItem(
    description: json['description'] as String?,
    simpleMediaItem: json['simpleMediaItem'] == null
        ? null
        : SimpleMediaItem.fromJson(
            json['simpleMediaItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewMediaItemToJson(NewMediaItem instance) =>
    <String, dynamic>{
      'description': instance.description,
      'simpleMediaItem': instance.simpleMediaItem,
    };

SimpleMediaItem _$SimpleMediaItemFromJson(Map<String, dynamic> json) {
  return SimpleMediaItem(
    json['uploadToken'] as String,
  );
}

Map<String, dynamic> _$SimpleMediaItemToJson(SimpleMediaItem instance) =>
    <String, dynamic>{
      'uploadToken': instance.uploadToken,
    };

AlbumPosition _$AlbumPositionFromJson(Map<String, dynamic> json) {
  return AlbumPosition(
    json['relativeMediaItemId'] as String?,
    json['relativeEnrichmentItemId'] as String?,
    _$enumDecode(_$PositionTypeEnumMap, json['position']),
  );
}

Map<String, dynamic> _$AlbumPositionToJson(AlbumPosition instance) =>
    <String, dynamic>{
      'relativeMediaItemId': instance.relativeMediaItemId,
      'relativeEnrichmentItemId': instance.relativeEnrichmentItemId,
      'position': _$PositionTypeEnumMap[instance.position],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PositionTypeEnumMap = {
  PositionType.POSITION_TYPE_UNSPECIFIED: 'POSITION_TYPE_UNSPECIFIED',
  PositionType.FIRST_IN_ALBUM: 'FIRST_IN_ALBUM',
  PositionType.LAST_IN_ALBUM: 'LAST_IN_ALBUM',
  PositionType.AFTER_MEDIA_ITEM: 'AFTER_MEDIA_ITEM',
  PositionType.AFTER_ENRICHMENT_ITEM: 'AFTER_ENRICHMENT_ITEM',
};

BatchCreateMediaItemsResponse _$BatchCreateMediaItemsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateMediaItemsResponse(
    (json['newMediaItemResults'] as List<dynamic>?)
        ?.map((e) => NewMediaItemResult.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BatchCreateMediaItemsResponseToJson(
        BatchCreateMediaItemsResponse instance) =>
    <String, dynamic>{
      'newMediaItemResults': instance.newMediaItemResults,
    };

NewMediaItemResult _$NewMediaItemResultFromJson(Map<String, dynamic> json) {
  return NewMediaItemResult(
    json['uploadToken'] as String,
    json['mediaItem'] == null
        ? null
        : MediaItem.fromJson(json['mediaItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewMediaItemResultToJson(NewMediaItemResult instance) =>
    <String, dynamic>{
      'uploadToken': instance.uploadToken,
      'mediaItem': instance.mediaItem,
    };

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return MediaItem(
    json['id'] as String,
    json['description'] as String?,
    json['productUrl'] as String?,
    json['baseUrl'] as String?,
  );
}

Map<String, dynamic> _$MediaItemToJson(MediaItem instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'productUrl': instance.productUrl,
      'baseUrl': instance.baseUrl,
    };

SearchMediaItemsResponse _$SearchMediaItemsResponseFromJson(
    Map<String, dynamic> json) {
  return SearchMediaItemsResponse(
    (json['mediaItems'] as List<dynamic>?)
        ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['nextPageToken'] as String?,
  );
}

Map<String, dynamic> _$SearchMediaItemsResponseToJson(
        SearchMediaItemsResponse instance) =>
    <String, dynamic>{
      'mediaItems': instance.mediaItems,
      'nextPageToken': instance.nextPageToken,
    };

SearchMediaItemsRequest _$SearchMediaItemsRequestFromJson(
    Map<String, dynamic> json) {
  return SearchMediaItemsRequest(
    albumId: json['albumId'] as String?,
    pageSize: json['pageSize'] as int?,
    pageToken: json['pageToken'] as String?,
  );
}

Map<String, dynamic> _$SearchMediaItemsRequestToJson(
        SearchMediaItemsRequest instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'pageSize': instance.pageSize,
      'pageToken': instance.pageToken,
    };
