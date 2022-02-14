import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          genre.name,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
