abstract class WatchedDataSource {
  Future<void> setEpisodeWatchedStats(String id, double stats);
  Future<double> getEpisodeWatchedStats(String id);
}
