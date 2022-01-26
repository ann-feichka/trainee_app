import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/genres_list.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isLandscape;

  const MovieCard({Key? key, required this.movie, required this.isLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Text(StringConstants().error),
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
                isLandscape ? Container() : GenresList(movie: movie),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
