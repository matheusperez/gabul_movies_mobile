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
        title: Text(bloc.category.name),
      ),
      body: StreamBuilder<bool>(
        stream: bloc.isLoadingController.stream,
        initialData: true,
        builder: (context, snapshot) {

          if(snapshot.data){
            return Container(child: Center(child: CircularProgressIndicator(),),);
          }

          return Container(
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
                          fit: BoxFit.cover,
                        ),
                        footer: Container(
                          decoration: BoxDecoration(
                            color: Colors.black54
                          ),
                          child: Text(snapshot.data[index].videoTitle),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2/3,
                        crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
                  );
                }),
          );
        }
      ),
    );
  }
}
