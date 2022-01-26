import 'package:flutter/material.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/string_constants.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(StringConstants().chooseArch,
              style: Theme.of(context).textTheme.headline5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: size.width / 3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(moviesPage, arguments: true);
                    },
                    child: Text(StringConstants().bloc)),
              ),
              Container(
                width: size.width / 3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(moviesPage, arguments: false);
                    },
                    child: Text(StringConstants().mvvm)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
