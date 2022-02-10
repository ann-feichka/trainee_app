import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/popular_movie_response.dart';

class MovieRepository {
  MovieApi movieApi = AppInstance.movieApi;

  Future<MovieResponse> getMovie(int id) async {
    MovieResponse movie = await movieApi.fetchMovieDetails(id: id);
    return movie;
  }

  Future<PopularMovieResponse> fetchMoviesList() async {
    PopularMovieResponse movieResponse =
        await movieApi.fetchPopularMovie().catchError(
      (Object e) {
        print(e.toString());
      },
    );
    return movieResponse;
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
