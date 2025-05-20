import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/core/utils.dart';
import 'package:netflix/features/home/domain/models/movie.dart';
import 'package:netflix/features/home/provider/movie_provider.dart';

import '../screens/movie_detail_screen.dart';

class MovieTile extends ConsumerWidget {
  final Movie movie;

  MovieTile({required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedMovies = ref.watch(likedProvider);
    final isLiked = likedMovies.contains(movie);

    return ListTile(
      leading: Image.network('$baseImageUrl${movie.posterPath}', width: 50),
      title: Text(movie.title),
      subtitle: Text(
        movie.overview, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: IconButton(
          onPressed: (){
            final notifier = ref.read(likedProvider.notifier);
            if(isLiked){
              notifier.state = List.from(notifier.state)..remove(movie);
            }else {
              notifier.state = List.from(notifier.state)..add(movie);
            }
          },
          icon: Icon(isLiked? Icons.favorite : Icons.favorite_border)
      ),
        onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailScreen(movie: movie),
      ),
    ),
    );
  }
}