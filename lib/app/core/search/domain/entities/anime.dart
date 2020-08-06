class Anime {
  final String id;
  final String title;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;
  final bool isFavorite;

  Anime(
      {this.id,
      this.title,
      this.imageUrl,
      this.imageHttpHeaders,
      this.isFavorite});
}
