import 'dart:convert';

import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:flutter/foundation.dart';

class EpisodeDetailsModel extends EpisodeDetails {
  final String id;
  final String animeId;
  final String label;
  final String url;
  final String urlHd;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;

  EpisodeDetailsModel({
    this.id,
    this.animeId,
    this.label,
    this.url,
    this.urlHd,
    this.imageUrl,
    this.imageHttpHeaders,
  });

  EpisodeDetailsModel copyWith({
    String id,
    String animeId,
    String label,
    String url,
    String urlHd,
    String imageUrl,
    Map<String, String> imageHttpHeaders,
  }) {
    return EpisodeDetailsModel(
      id: id ?? this.id,
      animeId: animeId ?? this.animeId,
      label: label ?? this.label,
      url: url ?? this.url,
      urlHd: urlHd ?? this.urlHd,
      imageUrl: imageUrl ?? this.imageUrl,
      imageHttpHeaders: imageHttpHeaders ?? this.imageHttpHeaders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'animeId': animeId,
      'label': label,
      'url': url,
      'urlHd': urlHd,
      'imageUrl': imageUrl,
      'imageHttpHeaders': imageHttpHeaders,
    };
  }

  factory EpisodeDetailsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EpisodeDetailsModel(
      id: map['id'],
      animeId: map['animeId'],
      label: map['label'],
      url: map['url'],
      urlHd: map['urlHd'],
      imageUrl: map['imageUrl'],
      imageHttpHeaders: Map<String, String>.from(map['imageHttpHeaders']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeDetailsModel.fromJson(String source) =>
      EpisodeDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EpisodeDetailsModel(id: $id, animeId: $animeId, label: $label, url: $url, urlHd: $urlHd, imageUrl: $imageUrl, imageHttpHeaders: $imageHttpHeaders)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EpisodeDetailsModel &&
        o.id == id &&
        o.animeId == animeId &&
        o.label == label &&
        o.url == url &&
        o.urlHd == urlHd &&
        o.imageUrl == imageUrl &&
        mapEquals(o.imageHttpHeaders, imageHttpHeaders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        animeId.hashCode ^
        label.hashCode ^
        url.hashCode ^
        urlHd.hashCode ^
        imageUrl.hashCode ^
        imageHttpHeaders.hashCode;
  }
}
