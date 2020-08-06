class EpisodeDetails {
  final String id;
  final String animeId;
  final String label;
  final String url;
  final String urlHd;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;

  EpisodeDetails({
    this.id,
    this.animeId,
    this.label,
    this.url,
    this.urlHd,
    this.imageUrl,
    this.imageHttpHeaders,
  });
}
