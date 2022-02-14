import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/api/movie_api_constant.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/model/popular_movie_model.dart';

class MovieApiImpl extends MovieApi {
  @override
  Future<MovieModel?> fetchMovieDetails({required int id}) async {
    try {
      final response = await http.get(
          Uri.http(baseUrl, MovieApiConstant.movieDetailsRoute + id.toString(),
              baseQueryParameters),
          headers: baseHeader);

      Map<String, dynamic> body = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return MovieModel.fromJson(body);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      MovieModel.withError("Data not found / Connection issue");
    }
  }

  @override
  Future<PopularMovieModel?> fetchPopularMovie() async {
    try {
      final response = await http.get(
          Uri.http(
              baseUrl, MovieApiConstant.popularMovieRoute, baseQueryParameters),
          headers: baseHeader);
      Map<String, dynamic> body = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return PopularMovieModel.fromJson(body);
      }
    } catch (error, stacktrace) {
      String errorMessage;
      if (error is SocketException) {
        errorMessage = "Failed to fetch data. is your device online?";
      } else {
        errorMessage = "Data not found / Connection issue";
      }
      print("Exception occured: $error stackTrace: $stacktrace");
      return PopularMovieModel.withError(errorMessage);
    }
  }
}
