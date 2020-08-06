import 'package:anime_dart/app/core/watched/infra/data_sources/watched_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsWatchedDataSource implements WatchedDataSource {
  final _watchedListKey = "anime__dart__application__watched__episodes";
  final _watchedPrefix = "anime__dart__application__favorites__prefix";

  String _getWatchedKey(String id) {
    return _watchedPrefix + id;
  }

  @override
  Future<double> getEpisodeWatchedStats(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      double stats = prefs.getBool(_getWatchedKey(id)) ?? 0;

      return stats;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> setEpisodeWatchedStats(String id, double newStats) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      prefs.setDouble(_getWatchedKey(id), newStats);

      final watchedList = prefs.getStringList(_watchedListKey);

      int index = watchedList.indexOf(id);

      if (newStats != 0) {
        if (index == null) {
          watchedList.insert(0, id);
        }
      } else {
        if (index != null) {
          watchedList.removeAt(index);
        }
      }

      prefs.setStringList(_watchedListKey, watchedList);
    } catch (e) {
      throw e;
    }
  }
}
