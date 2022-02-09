// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieFromJson(Map<String, dynamic> json) => MovieResponse(
      id: json['id'] as int,
      isAdult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overView: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
      isVideo: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      budget: json['budget'] as int,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtime: json['runtime'] as int,
      releaseDate: json['release_date'] as String,
    );

Map<String, dynamic> _$MovieToJson(MovieResponse instance) => <String, dynamic>{
      'id': instance.id,
      'adult': instance.isAdult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overView,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.isVideo,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'budget': instance.budget,
      'genres': instance.genres,
      'production_companies': instance.productionCompanies,
      'runtime': instance.runtime,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      countryAtributes: json['origin_country'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.countryAtributes,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
