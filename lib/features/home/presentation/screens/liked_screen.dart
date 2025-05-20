import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/movie_provider.dart';
import '../widgets/movie_tile.dart';

class LikedScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedMovies = ref.watch(likedProvider);
    return ListView.builder(
      itemCount: likedMovies.length,
      itemBuilder: (_, i) => MovieTile(movie: likedMovies[i]),
    );
  }
}