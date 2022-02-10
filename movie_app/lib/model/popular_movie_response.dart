import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/movie_response.dart';

part 'popular_movie_response.g.dart';

@JsonSerializable()
class PopularMovieResponse {
  int? page;
  @JsonKey(name: 'results')
  List<MovieResponse>? movies;
  String? error;
  PopularMovieResponse({this.page, this.movies});
  PopularMovieResponse.withError(String errorMessage) {
    error = errorMessage;
  }
  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMovieResponseToJson(this);
}
