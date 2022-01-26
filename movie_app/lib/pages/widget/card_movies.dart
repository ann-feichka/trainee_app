import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/pages/widget/genres.dart';
import 'package:movie_app/routes.dart';

class CardMovies extends StatelessWidget {
  final Movie movie;
  final bool isBloc;
  final bool isLandscape;
  final onTap;

  const CardMovies(
      {Key? key,
      required this.movie,
      required this.isBloc,
      required this.isLandscape, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: isLandscape? onTap:() {
          Navigator.of(context).pushNamed(detailsPage,
              arguments:
                  MovieDetailsArguments(isBloc: isBloc, movieId: movie.id));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                    width: isLandscape
                        ? MediaQuery.of(context).size.width / 10
                        : MediaQuery.of(context).size.width / 3,
                    height: isLandscape
                        ? MediaQuery.of(context).size.width / 10
                        : MediaQuery.of(context).size.width / 3,
                    fit: BoxFit.cover,
                    imageUrl: movie.poster,
                    placeholder: (context, url) =>
                        CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) => Text("Error"),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        movie.title,
                        style: isLandscape
                            ? Theme.of(context).textTheme.headline6
                            : Theme.of(context).textTheme.headline5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15.0),
                      child: Text(
                        '${movie.year}',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    isLandscape ? Container() : Genres(movie: movie),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildGenreChip(Movie movie) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(8),
    child: Text(
      movie.genre[0],
      style: TextStyle(fontSize: 12),
    ),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
