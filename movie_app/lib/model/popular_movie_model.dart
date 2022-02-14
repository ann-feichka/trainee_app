import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/movie_model.dart';

part 'popular_movie_model.g.dart';

@JsonSerializable()
class PopularMovieModel {
  int? page;
  @JsonKey(name: 'results')
  List<MovieModel>? movies;
  String? error;
  PopularMovieModel({this.page, this.movies});
  PopularMovieModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory PopularMovieModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMovieModelToJson(this);
}
