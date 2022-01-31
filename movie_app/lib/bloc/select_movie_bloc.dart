abstract class MovieState {
  List<Object?> get props => [];
}

class MovieSelectedState extends MovieState {
  final int id;

  MovieSelectedState(this.id);
  @override
  List<Object?> get props => [id];
}

class MovieUnselectedState extends MovieState {}
