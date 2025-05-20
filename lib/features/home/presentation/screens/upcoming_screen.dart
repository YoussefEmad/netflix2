import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/movie_provider.dart';
import '../widgets/movie_tile.dart';

class UpcomingScreen extends ConsumerWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(upcomingProvider);
    return movies.when(
      data: (list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, i) => MovieTile(movie: list[i]),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text('Error')),
    );
  }
}