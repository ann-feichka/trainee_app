import 'package:movie_app/model/movie.dart';

abstract class MovieDetailEvent{
  MovieDetailEvent();

  Object? get props => null;
}

class MovieDetailFetch extends MovieDetailEvent{

  final int? id;

  MovieDetailFetch({required this.id});

  @override
  Object? get props => id;
}