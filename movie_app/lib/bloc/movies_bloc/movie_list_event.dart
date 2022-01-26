abstract class MovieListEvent {
  List<Object?> get props => [];
}

class MovieListFetched extends MovieListEvent {
  final bool isShuffled;

  MovieListFetched({required this.isShuffled});

  @override
  List<Object?> get props => [isShuffled];
}
