import 'package:hasura_connect/hasura_connect.dart';
import 'package:palestra/src/shared/model/category_model.dart';
import 'package:palestra/src/shared/model/movie_model.dart';

class HasuraRepository {
  final HasuraConnect conn;

  HasuraRepository(this.conn);

  Snapshot<List<CategoryModel>> getCategoria() {
    try {
      String query = '''subscription {
                        categories(order_by: {name: asc}) {
                          id
                          name
                          }
                        }''';

      Snapshot snapshot =
          conn.subscription(query).map<List<CategoryModel>>((json) {
        return CategoryModel.fromJsonList(json['data']['categories']);
      });

      return snapshot;
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getCategoria]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }

  Snapshot<List<MovieModel>> getMovies(CategoryModel category) {
    try {
      String query = '''subscription getMovies(\$categoryId:Int!){
                          posts(where: {cat_id: {_eq: 50}}, order_by: {video_title: asc}) {
                            id
                            cat_id
                            video_title
                            video_thumbnail
                          }
                        }''';

      Snapshot snapshot =
          conn.subscription(query, variables: {'categoryId': category.id}).map<List<MovieModel>>((json) {
        return MovieModel.fromJsonList(json['data']['posts']);
      });

      return snapshot;
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getCategoria]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }
}
