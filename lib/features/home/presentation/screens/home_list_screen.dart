import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/features/home/provider/movie_provider.dart';

import '../widgets/movie_tile.dart';

class HomeListScreen extends ConsumerWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.read(nowPlayingProvider);
    return movieList.when(
      data:
          (movies) => ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, i) => MovieTile(movie: movies[i]),
          ),
      error: (_, __) => Center(child: Text('Error loading movies')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
