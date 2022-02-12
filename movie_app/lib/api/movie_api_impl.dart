import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/api/movie_api_constant.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/popular_movie_response.dart';

class MovieApiImpl extends MovieApi {
  static PopularMovieResponse? localResponse;
  @override
  Future<MovieResponse?> fetchMovieDetails({required int id}) async {
    try {
      final response = await http.get(
          Uri.http(baseUrl, MovieApiConstant.movieDetailsRoute + id.toString(),
              baseQueryParameters),
          headers: baseHeader);

      Map<String, dynamic> body = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(body);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      MovieResponse.withError("Data not found / Connection issue");
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
        localResponse = PopularMovieResponse.fromJson(body);
        return localResponse;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PopularMovieResponse.withError(
          "Data not found / Connection issue");
    }
  }
}
