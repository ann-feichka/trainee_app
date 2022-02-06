import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/model/movie_preview.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/vote_average_widget.dart';

class MovieCard extends StatelessWidget {
  final MoviePreview movie;
  final bool isLandscape;

  const MovieCard({Key? key, required this.movie, required this.isLandscape})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
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
                width: isLandscape ? size.width / 10 : size.width / 3,
                height: isLandscape ? size.width / 10 : size.width / 3,
                fit: BoxFit.cover,
                imageUrl: MovieApi.baseImageUrl + "w500/" + movie.posterPath!,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Center(child: Text(StringConstants.error)),
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
                    movie.title!,
                    style:
                        isLandscape ? textTheme.headline6 : textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                VoteAverageWidget(voteAverage: movie.voteAverage.toString())
              ],
            ),
          ))
        ],
      ),
    );
  }
}
