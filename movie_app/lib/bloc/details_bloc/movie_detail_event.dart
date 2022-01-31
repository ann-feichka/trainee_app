abstract class MovieDetailEvent {
  MovieDetailEvent();

  List<Object?> get props => [];
}

class MovieDetailFetchEvent extends MovieDetailEvent {
  final int? id;

  MovieDetailFetchEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class MovieDetailResetEvent extends MovieDetailEvent {}
