import 'package:anime_dart/app/core/watched/infra/data_sources/watched_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsWatchedDataSource implements WatchedDataSource {
  final _watchedListKey = "anime__dart__application__watched__episodes";
  final _watchedPrefix = "anime__dart__application__watched__prefix";
  SharedPreferences _prefs;

  String _getWatchedKey(String id) {
    return _watchedPrefix + id;
  }

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs != null) {
      return _prefs;
    }

    _prefs = await SharedPreferences.getInstance();

    return _prefs;
  }

  @override
  Future<double> getEpisodeWatchedStats(String id) async {
    try {
      final prefs = await _getPrefs();

      double stats = prefs.getDouble(_getWatchedKey(id)) ?? 0;

      return stats;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> setEpisodeWatchedStats(String id, double newStats) async {
    try {
      final prefs = await _getPrefs();

      prefs.setDouble(_getWatchedKey(id), newStats);

      final watchedList = prefs.getStringList(_watchedListKey) ?? <String>[];

      int index = watchedList.indexOf(id);

      if (newStats > 0) {
        if (index == -1) {
          watchedList.insert(0, id);
        }
      } else {
        if (index != -1) {
          watchedList.removeAt(index);
        }
      }

      prefs.setStringList(_watchedListKey, watchedList);
    } catch (e) {
      throw e;
    }
  }
}
