import 'package:flutter/material.dart';

class VoteAverageWidget extends StatelessWidget {
  final String voteAverage;
  const VoteAverageWidget({Key? key, required this.voteAverage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Row(
        children: [
          Text(
            voteAverage,
            style: TextStyle(color: Colors.black54),
          ),
          Icon(
            Icons.star,
            color: Colors.amberAccent,
          )
        ],
      ),
    );
  }
}
