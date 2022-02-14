import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  int? id;
  @JsonKey(name: 'adult')
  bool? isAdult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overView;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  @JsonKey(name: 'video')
  bool? isVideo;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  int? budget;
  List<Genre>? genres;
  @JsonKey(name: 'production_companies')
  List<Company>? productionCompanies;
  int? runtime;
  String? error;

  MovieModel({
    this.id,
    this.isAdult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overView,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.isVideo,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.genres,
    this.productionCompanies,
    this.runtime,
  });
  MovieModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

@JsonSerializable()
class Company {
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  final String name;
  @JsonKey(name: 'origin_country')
  final String countryAtributes;

  Company(
      {required this.id,
      this.logoPath,
      required this.name,
      required this.countryAtributes});
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
