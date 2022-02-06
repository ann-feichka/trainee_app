import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/api/movie_api_constant.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/popular_movie_response.dart';

class MovieApiImpl extends MovieApi {
  @override
  Future<Movie?> fetchMovieDetails({required int id}) async {
    try {
      final response = await http.get(
          Uri.http(baseUrl, MovieApiConstant.movieDetailsRoute + id.toString(),
              baseQueryParameters),
          headers: baseHeader);

      Map<String, dynamic> body = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return Movie.fromJson(body);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  Future<PopularMovieResponse?> fetchPopularMovie() async {
    try {
      final response = await http.get(
          Uri.http(
              baseUrl, MovieApiConstant.popularMovieRoute, baseQueryParameters),
          headers: baseHeader);
      Map<String, dynamic> body = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return PopularMovieResponse.fromJson(body);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
