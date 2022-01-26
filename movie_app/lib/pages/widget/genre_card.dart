

import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {

  final String genre;
  const GenreCard({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20 / 5, // 5 padding top and bottom
        ),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          // border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          genre,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );;
  }
}
