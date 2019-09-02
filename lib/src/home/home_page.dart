import 'package:flutter/material.dart';
import 'package:palestra/src/home/home_bloc.dart';
import 'package:palestra/src/movie/movie_module.dart';
import 'package:palestra/src/shared/model/category_model.dart';

import 'home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = HomeModule.to.bloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    //app.getList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Gabus Movies"),
      ),
      body: Container(
          child: StreamBuilder<List<CategoryModel>>(
        stream: bloc?.categoryStream?.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return ListView.separated(
                separatorBuilder: (context,index)=>Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) => ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MovieModule(snapshot.data[i]),
                  ),
                ),
                title: Text(snapshot.data[i].name),
              ),
            );
          }
        },
      )),
    );
  }
}
