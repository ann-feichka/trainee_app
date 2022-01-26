import 'package:flutter/material.dart';

import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List casts;
  final bool isLandscape;
  const CastAndCrew({Key? key, required this.casts, required this.isLandscape}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Cast & Crew",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: casts.length,
            itemBuilder: (context, index) => CastCard(cast: casts[index],isLandscape:isLandscape),
          ),
        )
      ],
    );
  }
}
