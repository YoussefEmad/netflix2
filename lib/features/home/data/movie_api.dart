import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/features/home/domain/models/movie.dart';
class MovieApi {
  final String _apiKey = 'c145dac51f51a9eeb873673b760304ed';

  Future<List<Movie>> fetchMovies(String type) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$type?api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Movie>.from(data['results'].map((x) => Movie.fromJson(x)));
    } else {
      throw Exception('Falid to load Movie');
    }
  }
}