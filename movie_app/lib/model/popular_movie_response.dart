import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/movie_preview.dart';

part 'popular_movie_response.g.dart';

@JsonSerializable()
class PopularMovieResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<MoviePreview> movies;

  PopularMovieResponse({required this.page, required this.movies});
  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMovieResponseToJson(this);
}
