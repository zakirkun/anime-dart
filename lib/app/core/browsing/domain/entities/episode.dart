class Episode {
  final String id;
  final String animeId;
  final String label;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;

  Episode({
    this.id,
    this.animeId,
    this.label,
    this.imageUrl,
    this.imageHttpHeaders,
  });
}
