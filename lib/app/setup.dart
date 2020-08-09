import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/browsing/external/data_sources/anime_tv_browsing_data_source.dart';
import 'package:anime_dart/app/core/browsing/infra/data_sources/browsing_data_source.dart';
import 'package:anime_dart/app/core/browsing/infra/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/details/external/data_source/anime_tv_details_data_source.dart';
import 'package:anime_dart/app/core/details/infra/data_source/details_data_source.dart';
import 'package:anime_dart/app/core/details/infra/repositories/details_repository.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/favorites/external/data_sources/shared_prefs_data_source.dart';
import 'package:anime_dart/app/core/favorites/infra/data_sources/favorites_data_source.dart';
import 'package:anime_dart/app/core/favorites/infra/repositories/favorites_repository.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:anime_dart/app/core/search/external/data_sources/anime_tv_search_data_source.dart';
import 'package:anime_dart/app/core/search/infra/data_sources/search_data_source.dart';
import 'package:anime_dart/app/core/search/infra/repositories/search_repository.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:anime_dart/app/core/watched/external/data_sources/shared_prefs_data_source.dart';
import 'package:anime_dart/app/core/watched/infra/data_sources/watched_data_source.dart';
import 'package:anime_dart/app/core/watched/infra/repositories/watched_repository.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:anime_dart/app/store/player_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // =========================================
  // LOCAL FEATURES (WATCHED & FAVORITES)
  // =========================================
  getIt
      .registerSingleton<FavoritesDataSource>(SharedPrefsFavoritesDataSource());

  getIt.registerSingleton<FavoritesRepository>(
      FavoritesRepositoryImplementation(
          dataSource: getIt<FavoritesDataSource>()));

  getIt.registerSingleton<WatchedDataSource>(SharedPrefsWatchedDataSource());

  getIt.registerSingleton<WatchedRepository>(
      WatchedRepositoryImplementation(dataSource: getIt<WatchedDataSource>()));

  // =========================================
  // MAIN FEATURE (SEE DETAILS || WATCH)
  // =========================================
  getIt.registerSingleton<DetailsDataSource>(AnimeTvDetailsDataSource(
      watched: getIt<WatchedRepository>(),
      favorites: getIt<FavoritesRepository>()));

  getIt.registerSingleton<DetailsRepository>(
      DetailsRepositoryImplementation(dataSource: getIt<DetailsDataSource>()));

  // ===================================
  // SEARCH FEATURE
  // ===================================
  getIt.registerSingleton<SearchDataSource>(
      AnimeTvSearchDataSource(favorites: getIt<FavoritesRepository>()));

  getIt.registerSingleton<SearchRepository>(SearchRepositoryImplementation(
    dataSource: getIt<SearchDataSource>(),
  ));

  // ===================================
  // BROWSING FEATURE (LATESTS, RANDOM, ETC, ALL PAGINATION)
  // ===================================
  getIt.registerSingleton<BrowsingDataSource>(AnimeTvBrowsingDataSource(
      favorites: getIt<FavoritesRepository>(),
      watched: getIt<WatchedRepository>()));

  getIt.registerSingleton<BrowsingRepository>(BrowsingRepositoryImplementation(
      dataSource: getIt<BrowsingDataSource>()));

  // ===================================
  // STATE MANAGEMENT STORES
  // ===================================
  getIt.registerSingleton<HomeStore>(HomeStore(
      repository: getIt<BrowsingRepository>(),
      favoritesRepository: getIt<FavoritesRepository>(),
      watchedRepository: getIt<WatchedRepository>()));

  getIt.registerSingleton<CentralStore>(CentralStore(
      favoritesRepository: getIt<FavoritesRepository>(),
      detailsRepository: getIt<DetailsRepository>(),
      homeStore: getIt<HomeStore>(),
      watchedRepository: getIt<WatchedRepository>()));

  getIt.registerSingleton<PlayerStore>(PlayerStore());
}
