// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieModel _$PopularMovieModelFromJson(Map<String, dynamic> json) =>
    PopularMovieModel(
      page: json['page'] as int?,
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..error = json['error'] as String?;

Map<String, dynamic> _$PopularMovieModelToJson(PopularMovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
      'error': instance.error,
    };
