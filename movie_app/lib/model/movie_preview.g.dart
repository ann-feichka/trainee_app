// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePreview _$MoviePreviewFromJson(Map<String, dynamic> json) => MoviePreview(
      id: json['id'] as int?,
      backdropPath: json['backdrop_path'] as String?,
      overView: json['overView'] as String?,
      posterPath: json['poster_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MoviePreviewToJson(MoviePreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'overView': instance.overView,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
