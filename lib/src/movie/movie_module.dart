import 'package:palestra/src/movie/movie_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:palestra/src/movie/movie_page.dart';
import 'package:palestra/src/shared/model/category_model.dart';
import 'package:palestra/src/shared/repository/hasura_repository.dart';

import '../app_module.dart';

class MovieModule extends ModuleWidget {
  final CategoryModel category;

  MovieModule(this.category);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => MovieBloc(i.get<HasuraRepository>(), category: category)),
      ];

  @override
  List<Dependency> get dependencies =>
      [Dependency((i) => AppModule.to.get<HasuraRepository>())];

  @override
  Widget get view => MoviePage();

  static Inject get to => Inject<MovieModule>.of();
}
