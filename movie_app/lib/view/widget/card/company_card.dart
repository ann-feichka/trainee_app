import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';

class CompanyCard extends StatelessWidget {
  final Company company;
  final bool isLandscape;

  const CompanyCard(
      {Key? key, required this.company, required this.isLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isLandscape
          ? MediaQuery.of(context).size.width / 5
          : MediaQuery.of(context).size.width / 3,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: company.logoPath != null
                    ? CachedNetworkImage(
                        imageUrl:
                            MovieApi.baseImageUrl + 'w154/' + company.logoPath!,
                        fit: BoxFit.fill,
                        width: 90,
                        height: 90,
                        placeholder: (context, url) =>
                            CircularProgressIndicator.adaptive(),
                        errorWidget: (context, url, error) =>
                            Text(StringConstants.error),
                      )
                    : Container(
                        width: 90,
                        height: 90,
                        child: Center(
                          child: Text("No logo"),
                        ),
                      ),
              ),
            ),
            Text(
              company.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                company.countryAtributes,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
