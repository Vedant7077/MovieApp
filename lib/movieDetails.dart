import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatefulWidget {
  final String movieId = "";
  // const MoviesDetails(){
  //
  // }

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieDetails"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("hello")
          ],
            ),
      )
    );
  }
}
