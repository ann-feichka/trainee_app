import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';

class NoDetailsWidget extends StatelessWidget {
  const NoDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(StringConstants.noDetails),
    );
  }
}
