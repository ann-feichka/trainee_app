import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';

class CastCard extends StatelessWidget {
  final Map cast;
  final bool isLandscape;

  const CastCard({Key? key, required this.cast, required this.isLandscape})
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
                child: CachedNetworkImage(
                  imageUrl: cast['image'],
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                  placeholder: (context, url) =>
                      CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) =>
                      Text(StringConstants.error),
                ),
              ),
            ),
            Text(
              cast['orginalName'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                cast['movieName'],
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
