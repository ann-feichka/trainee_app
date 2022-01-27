abstract class MovieDetailEvent {
  MovieDetailEvent();

  List<Object?> get props => [];
}

class MovieDetailFetch extends MovieDetailEvent {
  final int? id;

  MovieDetailFetch(this.id);

  @override
  List<Object?> get props => [id];
}
