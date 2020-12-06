abstract class WatchedDataSource {
  Future<void> setEpisodeWatchedStats(String id, double stats);
  Future<double> getEpisodeWatchedStats(String id);
  Future<void> importWatchedData(String data, {bool merge});
  Future<String> exportWatchedData();
  Future<void> resetWatchedData();
}
