import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/features/home/domain/models/movie.dart';

import '../data/movie_api.dart';

final movieApiProvider = Provider((ref) => MovieApi());


final nowPlayingProvider = FutureProvider<List<Movie>>(
      (ref) => ref.read(movieApiProvider).fetchMovies('now_playing'),
);

final upcomingProvider = FutureProvider((ref) => ref.read(movieApiProvider).fetchMovies('upcoming'));
final likedProvider = StateProvider<List<Movie>>((ref) => []);