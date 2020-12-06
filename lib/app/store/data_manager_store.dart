import 'dart:io';
import 'dart:math';

import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:mobx/mobx.dart';

part 'data_manager_store.g.dart';

class DataManagerStore = _DataManagerStoreBase with _$DataManagerStore;

abstract class _DataManagerStoreBase with Store {
  final _centralStore = getIt<CentralStore>();

  @action
  Future<String> exportWatchedData(String path) async {
    final source = await _centralStore.exportWatchedData();

    final filename = _getFilename('anime-dart-watch-history');

    final file = File('$path/$filename');

    file.writeAsStringSync(source);

    return source;
  }

  @action
  Future<void> importWatchedData(String source, {bool merge = true}) async {
    await _centralStore.importWatchedData(source, merge: merge);
  }

  String _getFilename(String label) {
    final preid = Random.secure().nextInt(5000);
    final posid = Random.secure().nextInt(5000);
    final date = DateTime.now().toIso8601String();

    final filename = '$preid-$label-$posid-$date.json';

    return filename;
  }
}
