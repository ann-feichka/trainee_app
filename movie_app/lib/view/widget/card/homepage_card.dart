import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard(
      {Key? key, required this.onBlocPressed, required this.onMVVMPressed})
      : super(key: key);
  final GestureTapCallback onBlocPressed;
  final GestureTapCallback onMVVMPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(StringConstants.chooseArch,
              style: Theme.of(context).textTheme.headline5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: ElevatedButton(
                    onPressed: onBlocPressed,
                    child: Text(StringConstants.bloc)),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: onMVVMPressed,
                    child: Text(StringConstants.mvvm)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
