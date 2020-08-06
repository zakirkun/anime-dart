import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  final String id;
  final String animeId;
  final String label;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;

  EpisodeModel({
    this.id,
    this.animeId,
    this.label,
    this.imageUrl,
    this.imageHttpHeaders,
  });

  EpisodeModel copyWith({
    String id,
    String animeId,
    String label,
    String imageUrl,
    Map<String, String> imageHttpHeaders,
  }) {
    return EpisodeModel(
      id: id ?? this.id,
      animeId: animeId ?? this.animeId,
      label: label ?? this.label,
      imageUrl: imageUrl ?? this.imageUrl,
      imageHttpHeaders: imageHttpHeaders ?? this.imageHttpHeaders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'animeId': animeId,
      'label': label,
      'imageUrl': imageUrl,
      'imageHttpHeaders': imageHttpHeaders,
    };
  }

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EpisodeModel(
      id: map['id'],
      animeId: map['animeId'],
      label: map['label'],
      imageUrl: map['imageUrl'],
      imageHttpHeaders: Map<String, String>.from(map['imageHttpHeaders']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeModel.fromJson(String source) =>
      EpisodeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EpisodeModel(id: $id, animeId: $animeId, label: $label, imageUrl: $imageUrl, imageHttpHeaders: $imageHttpHeaders)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EpisodeModel &&
        o.id == id &&
        o.animeId == animeId &&
        o.label == label &&
        o.imageUrl == imageUrl &&
        mapEquals(o.imageHttpHeaders, imageHttpHeaders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        animeId.hashCode ^
        label.hashCode ^
        imageUrl.hashCode ^
        imageHttpHeaders.hashCode;
  }
}
