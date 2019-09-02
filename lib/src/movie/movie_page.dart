import 'package:flutter/material.dart';
import 'package:palestra/src/movie/movie_bloc.dart';
import 'package:palestra/src/shared/constants.dart';
import 'package:palestra/src/shared/model/movie_model.dart';

import 'movie_module.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieBloc bloc = MovieModule.to.bloc<MovieBloc>();
  var scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GridView.builder(
                controller: scrollController,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Image.network(
                      '$URL_DOWNLOAD${snapshot.data[index].videoThumbnail}',
                      fit: BoxFit.fill,
                    ),
                    footer: Container(
                      decoration: BoxDecoration(),
                      child: Text(snapshot.data[index].videoTitle),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
              );
            }),
      ),
    );
  }
}
