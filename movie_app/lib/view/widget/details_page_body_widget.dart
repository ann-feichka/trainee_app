import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/companies_widget.dart';
import 'package:movie_app/view/widget/genres_list_widget.dart';

class DetailsPageBodyWidget extends StatelessWidget {
  final MovieResponse movie;

  const DetailsPageBodyWidget({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              child: CachedNetworkImage(
                height: 250,
                fit: BoxFit.cover,
                imageUrl: MovieApi.baseImageUrl + 'w500/' + movie.backdropPath!,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Text(StringConstants.error)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: Theme.of(context).textTheme.headline5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${movie.releaseDate}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(children: <Widget>[
                          Icon(Icons.star, color: Colors.amberAccent),
                          Center(child: Text(movie.voteAverage.toString())),
                        ]),
                      )
                    ],
                  ),
                  GenresList(movie: movie),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      StringConstants.plotSummary,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Text(
                    movie.overView,
                    style: TextStyle(
                      color: Color(0xFF737599),
                    ),
                  ),
                  CompaniesWidget(companies: movie.productionCompanies)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
