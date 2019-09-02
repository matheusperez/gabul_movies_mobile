import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:palestra/src/shared/model/category_model.dart';
import 'package:palestra/src/shared/repository/hasura_repository.dart';

import '../app_module.dart';

class HomeBloc extends BlocBase {
  final HasuraRepository hasura;


  HomeBloc({this.hasura}){
    categoryStream = hasura.getCategoria();
  }

  Snapshot<List<CategoryModel>> categoryStream;




  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    categoryStream.close();
    super.dispose();
  }
}
