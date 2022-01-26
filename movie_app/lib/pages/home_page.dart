import 'package:flutter/material.dart';
import 'package:movie_app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.height/3,
              // width: MediaQuery.of(context).size.height/3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    Text('What you choose?',style: Theme.of(context).textTheme.headline5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ElevatedButton(onPressed: (){
                            Navigator.of(context).pushNamed(moviesPage,arguments: true);
                          }, child: Text("Bloc")),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ElevatedButton(onPressed: (){
                            Navigator.of(context).pushNamed(moviesPage,arguments: false);
                          }, child: Text("MVVM")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
