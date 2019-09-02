import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:palestra/src/app_widget.dart';
import 'package:palestra/src/app_bloc.dart';

import 'shared/constants.dart';
import 'shared/repository/hasura_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
     Dependency((i) => HasuraRepository(i.get<HasuraConnect>())),
     Dependency((i) => HasuraConnect(URL_API)),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
