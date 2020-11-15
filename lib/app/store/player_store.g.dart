// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on _PlayerStoreBase, Store {
  final _$episodeUrlPlayingAtom =
      Atom(name: '_PlayerStoreBase.episodeUrlPlaying');

  @override
  String get episodeUrlPlaying {
    _$episodeUrlPlayingAtom.reportRead();
    return super.episodeUrlPlaying;
  }

  @override
  set episodeUrlPlaying(String value) {
    _$episodeUrlPlayingAtom.reportWrite(value, super.episodeUrlPlaying, () {
      super.episodeUrlPlaying = value;
    });
  }

  final _$episodeIdPlayingAtom =
      Atom(name: '_PlayerStoreBase.episodeIdPlaying');

  @override
  String get episodeIdPlaying {
    _$episodeIdPlayingAtom.reportRead();
    return super.episodeIdPlaying;
  }

  @override
  set episodeIdPlaying(String value) {
    _$episodeIdPlayingAtom.reportWrite(value, super.episodeIdPlaying, () {
      super.episodeIdPlaying = value;
    });
  }

  final _$flickManagerAtom = Atom(name: '_PlayerStoreBase.flickManager');

  @override
  FlickManager get flickManager {
    _$flickManagerAtom.reportRead();
    return super.flickManager;
  }

  @override
  set flickManager(FlickManager value) {
    _$flickManagerAtom.reportWrite(value, super.flickManager, () {
      super.flickManager = value;
    });
  }

  final _$initializePlayerControllerAsyncAction =
      AsyncAction('_PlayerStoreBase.initializePlayerController');

  @override
  Future<void> initializePlayerController() {
    return _$initializePlayerControllerAsyncAction
        .run(() => super.initializePlayerController());
  }

  final _$_PlayerStoreBaseActionController =
      ActionController(name: '_PlayerStoreBase');

  @override
  void setEpisodeDetails(String id, String url) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setEpisodeDetails');
    try {
      return super.setEpisodeDetails(id, url);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodeUrlPlaying: ${episodeUrlPlaying},
episodeIdPlaying: ${episodeIdPlaying},
flickManager: ${flickManager}
    ''';
  }
}
