// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieResponse _$PopularMovieResponseFromJson(
        Map<String, dynamic> json) =>
    PopularMovieResponse(
      page: json['page'] as int,
      movies: (json['results'] as List<dynamic>)
          .map((e) => MoviePreviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularMovieResponseToJson(
        PopularMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
    };
