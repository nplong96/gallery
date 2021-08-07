import 'package:json_annotation/json_annotation.dart';

part 'media_model.g.dart';

@JsonSerializable()
class BatchCreateMediaItemsRequest {
  BatchCreateMediaItemsRequest(this.albumId, this.newMediaItems,
      [this.albumPosition]);

  static BatchCreateMediaItemsRequest inAlbum(
      String uploadToken, String? albumId, String? description) {
    return BatchCreateMediaItemsRequest(
        albumId,
        <NewMediaItem>[
          NewMediaItem.simple(uploadToken, description),
        ],
        AlbumPosition.lastInAlbum());
  }

  factory BatchCreateMediaItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateMediaItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BatchCreateMediaItemsRequestToJson(this);

  String? albumId;
  List<NewMediaItem> newMediaItems;
  AlbumPosition? albumPosition;
}

@JsonSerializable()
class NewMediaItem {
  String? description;

  SimpleMediaItem? simpleMediaItem;

  NewMediaItem({this.description, this.simpleMediaItem});

  NewMediaItem.simple(String uploadToken, this.description)
      : simpleMediaItem = SimpleMediaItem(uploadToken);

  factory NewMediaItem.fromJson(Map<String, dynamic> json) =>
      _$NewMediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewMediaItemToJson(this);
}

@JsonSerializable()
class SimpleMediaItem {
  SimpleMediaItem(this.uploadToken);

  factory SimpleMediaItem.fromJson(Map<String, dynamic> json) =>
      _$SimpleMediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleMediaItemToJson(this);

  String uploadToken;
}

@JsonSerializable()
class AlbumPosition {
  AlbumPosition(
      this.relativeMediaItemId, this.relativeEnrichmentItemId, this.position);

  AlbumPosition.absolute(this.position);

  factory AlbumPosition.fromJson(Map<String, dynamic> json) =>
      _$AlbumPositionFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumPositionToJson(this);

  String? relativeMediaItemId;
  String? relativeEnrichmentItemId;
  PositionType position;

  static AlbumPosition lastInAlbum() =>
      AlbumPosition.absolute(PositionType.LAST_IN_ALBUM);
}

enum PositionType {
  POSITION_TYPE_UNSPECIFIED,
  FIRST_IN_ALBUM,
  LAST_IN_ALBUM,
  AFTER_MEDIA_ITEM,
  AFTER_ENRICHMENT_ITEM
}

@JsonSerializable()
class BatchCreateMediaItemsResponse {
  BatchCreateMediaItemsResponse(this.newMediaItemResults);

  factory BatchCreateMediaItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateMediaItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchCreateMediaItemsResponseToJson(this);

  List<NewMediaItemResult>? newMediaItemResults;
}

@JsonSerializable()
class NewMediaItemResult {
  NewMediaItemResult(this.uploadToken, this.mediaItem);

  factory NewMediaItemResult.fromJson(Map<String, dynamic> json) =>
      _$NewMediaItemResultFromJson(json);

  Map<String, dynamic> toJson() => _$NewMediaItemResultToJson(this);

  String uploadToken;
  MediaItem? mediaItem;
}

@JsonSerializable()
class MediaItem {
  MediaItem(this.id, this.description, this.productUrl, this.baseUrl);

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemToJson(this);

  String id;
  String? description;
  String? productUrl;
  String? baseUrl;
}

@JsonSerializable()
class SearchMediaItemsResponse {
  SearchMediaItemsResponse(this.mediaItems, this.nextPageToken);

  factory SearchMediaItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMediaItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMediaItemsResponseToJson(this);

  List<MediaItem>? mediaItems;
  String? nextPageToken;
}

@JsonSerializable()
class SearchMediaItemsRequest {
  SearchMediaItemsRequest({this.albumId, this.pageSize, this.pageToken});

  SearchMediaItemsRequest.albumId(this.albumId);

  factory SearchMediaItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchMediaItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMediaItemsRequestToJson(this);

  String? albumId;
  int? pageSize;
  String? pageToken;
}
