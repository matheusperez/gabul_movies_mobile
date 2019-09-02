import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:palestra/src/shared/model/category_model.dart';
import 'package:palestra/src/shared/model/movie_model.dart';
import 'package:palestra/src/shared/repository/hasura_repository.dart';

class MovieBloc extends BlocBase {
  final HasuraRepository hasura;
  final CategoryModel category; 

  MovieBloc(this.hasura,{this.category}){
    movieStream = hasura.getMovies(category);
    movieStream.changeVariable({'categoryId':category.id});
  }


  Snapshot<List<MovieModel>> movieStream;
  
    //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    //movieStream.close();
    super.dispose();
  }
}
