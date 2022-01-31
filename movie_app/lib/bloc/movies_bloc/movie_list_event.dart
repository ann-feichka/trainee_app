abstract class MovieListEvent {
  List<Object?> get props => [];
}

class MovieListFetched extends MovieListEvent {
  final bool isShuffled;

  MovieListFetched({required this.isShuffled});

  @override
  List<Object?> get props => [isShuffled];
}

class SelectMovieItem extends MovieListEvent {
  final int? id;

  SelectMovieItem({required this.id});
  @override
  List<Object?> get props => [id];
}
