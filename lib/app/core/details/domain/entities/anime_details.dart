class AnimeDetails {
  final String id;
  final String title;
  final String synopsis;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;
  final String year;
  final List<String> genres;

  AnimeDetails({
    this.id,
    this.title,
    this.synopsis,
    this.imageUrl,
    this.imageHttpHeaders,
    this.year,
    this.genres,
  });
}
