import 'package:flutter/material.dart';
import 'package:palestra/src/movie/movie_bloc.dart';
import 'package:palestra/src/shared/model/movie_model.dart';

import 'movie_module.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieBloc bloc = MovieModule.to.bloc<MovieBloc>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
      ),
      body: Container(
        child: StreamBuilder<List<MovieModel>>(
          stream: bloc.movieStream.stream,
          builder: (context, snapshot) {
            return GridView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text(' to aqui browww!! '),
                );
              }, 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                
                crossAxisCount: 5
                                       ),

            );
          }
        ),
      ),
    );
  }
}
