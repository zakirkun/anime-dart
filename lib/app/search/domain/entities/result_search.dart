import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  final String id;
  final String title;
  final String imageUrl;

  SearchResult({this.id, this.title, this.imageUrl});

  @override
  get props => [id, title, imageUrl];
}
