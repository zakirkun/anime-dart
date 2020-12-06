import 'package:anime_dart/app/core/watched/infra/data_sources/watched_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as json;

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

  @override
  Future<String> exportWatchedData() async {
    final prefs = await _getPrefs();

    final allKeys = prefs.getKeys();

    final statsKeys = allKeys.where((key) => key.contains(_watchedPrefix));

    final statsData = await Future.wait(List.from(statsKeys.map(
          (key) async {
            final id = key.replaceAll(_watchedPrefix, '');
            return {
              'id': id,
              'value': await getEpisodeWatchedStats(key),
            };
          },
        ).toList()) ??
        []);

    final data = json.jsonEncode(<String, dynamic>{
      'watched_list': await _getWatchedEpisodeList(),
      'stats_list': statsData,
    });

    return data;
  }

  @override
  Future<void> importWatchedData(String source, {bool merge = true}) async {
    final data = json.jsonDecode(source);

    final prefs = await _getPrefs();

    final currentWatchedList = prefs.getStringList(_watchedListKey) ?? [];

    final watchedList = data['watch_list'] ?? [];
    final statsList = List.from(data['stats_list']) ?? [];

    prefs.setStringList(
      _watchedListKey,
      merge ? [...watchedList, ...currentWatchedList] : watchedList,
    );

    statsList.forEach((stat) async {
      await prefs.setDouble(stat['id'], stat['value']);
    });
  }

  @override
  Future<void> resetWatchedData() async {
    final prefs = await _getPrefs();

    final allKeys = prefs.getKeys();

    allKeys.forEach((key) {
      final isStatsData = key.contains(_watchedPrefix);

      if (isStatsData) {
        prefs.remove(key);
      } else {
        final list = prefs.getStringList(_watchedListKey);

        try {
          list.removeWhere(
            (item) => item == key.replaceAll(_watchedPrefix, ''),
          );
        } catch (e) {}

        prefs.setStringList(_watchedListKey, list);
      }
    });
  }

  Future<List<String>> _getWatchedEpisodeList() async {
    final prefs = await _getPrefs();

    return prefs.getStringList(_watchedListKey);
  }
}
