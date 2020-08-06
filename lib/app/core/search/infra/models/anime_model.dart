import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

class AnimeModel extends Anime {
  final String id;
  final String title;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;
  final bool isFavorite;

  AnimeModel({
    this.id,
    this.title,
    this.imageUrl,
    this.imageHttpHeaders,
    this.isFavorite,
  });

  AnimeModel copyWith({
    String id,
    String title,
    String imageUrl,
    Map<String, String> imageHttpHeaders,
    bool isFavorite,
  }) {
    return AnimeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      imageHttpHeaders: imageHttpHeaders ?? this.imageHttpHeaders,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'imageHttpHeaders': imageHttpHeaders,
      'isFavorite': isFavorite,
    };
  }

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AnimeModel(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      imageHttpHeaders: Map<String, String>.from(map['imageHttpHeaders']),
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeModel.fromJson(String source) =>
      AnimeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnimeModel(id: $id, title: $title, imageUrl: $imageUrl, imageHttpHeaders: $imageHttpHeaders, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AnimeModel &&
        o.id == id &&
        o.title == title &&
        o.imageUrl == imageUrl &&
        mapEquals(o.imageHttpHeaders, imageHttpHeaders) &&
        o.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        imageHttpHeaders.hashCode ^
        isFavorite.hashCode;
  }
}
