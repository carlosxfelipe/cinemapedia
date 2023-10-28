import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final movieProviders = [
    ref.watch(nowPlayingMoviesProvider),
    ref.watch(upcomingMoviesProvider),
    ref.watch(popularMoviesProvider),
    ref.watch(topRatedMoviesProvider),
  ];

  return movieProviders.any((movies) => movies.isEmpty);
});
