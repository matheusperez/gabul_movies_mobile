import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:palestra/src/shared/model/category_model.dart';
import 'package:palestra/src/shared/model/movie_model.dart';
import 'package:palestra/src/shared/repository/hasura_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {
  final HasuraRepository hasura;
  final CategoryModel category;

  MovieBloc(this.hasura, {this.category}) {
    movieStream = hasura.getMovies(category);
    movieStream.changeVariable({'categoryId': category.id});

    Future.delayed(Duration(seconds: 2)).then((_) => isLoadingController.sink.add(false));
  }

  Snapshot<List<MovieModel>> movieStream;

  BehaviorSubject<bool> isLoadingController =BehaviorSubject<bool>.seeded(true);



  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    isLoadingController.close();
    super.dispose();
  }
}
