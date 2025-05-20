import 'package:flutter/material.dart';
import '../../domain/models/movie.dart';
import '../../../../core/utils.dart';


class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('$baseImageUrl${movie.posterPath}'),
            SizedBox(height: 20),
            Text(movie.overview, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}


