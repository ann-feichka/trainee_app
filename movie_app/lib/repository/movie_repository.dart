import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/model/popular_movie_model.dart';

class MovieRepository {
  MovieApi movieApi = AppInstance.movieApi;
  PopularMovieModel localResponse = PopularMovieModel();

  Future<MovieModel?> getMovie(int id) async {
    MovieModel? movie = await movieApi.fetchMovieDetails(id: id);
    return movie;
  }

  Future<PopularMovieModel> fetchMoviesList() async {
    PopularMovieModel movieResponse = await movieApi.fetchPopularMovie();
    if (movieResponse.error == null && movieResponse.movies != null) {
      localResponse = movieResponse;
    }
    return movieResponse;
  }

  Future<PopularMovieModel> fetchCashedMoviesList() async {
    return localResponse;
  }
}

class NetworkError extends Error {}
// Future<List<Movie>?> fetchMovieListWithRandom() async {
//   if (movies == null) {
//     return null;
//   } else {
//     List<Movie>? resMovies = List.from(movies);
//     return await _shuffleMovieList(resMovies);
//   }
// }
//
// Future<List<Movie>> _shuffleMovieList(List<Movie> movieList) async {
//   List<Movie> resMovies = List.from(movieList);
//   List<Movie> newMovies = [];
//   for (var _ in movieList) {
//     Movie randomMovie = resMovies.removeAt(_getRandomInt(resMovies.length));
//     newMovies.add(randomMovie);
//   }
//   return newMovies;
// }
//
// int _getRandomInt(int range) {
//   return Random().nextInt(range);
// }
