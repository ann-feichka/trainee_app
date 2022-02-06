import 'package:json_annotation/json_annotation.dart';

part 'movie_preview.g.dart';

@JsonSerializable()
class MoviePreview {
  final int? id;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final String? overView;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final double popularity;
  final String? title;
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  MoviePreview(
      {required this.id,
      this.backdropPath,
      required this.overView,
      this.posterPath,
      required this.popularity,
      required this.title,
      required this.voteAverage});

  factory MoviePreview.fromJson(Map<String, dynamic> json) =>
      _$MoviePreviewFromJson(json);
  Map<String, dynamic> toJson() => _$MoviePreviewToJson(this);
}
