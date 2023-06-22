import 'movie_data.dart';

/// data-repository
/// Created by wangzhen on 2023/6/22
class DataRepository {
  static provideMovies() {
    List<MovieData> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(MovieData(title: "将夜", asset: "assets/images/night.jpg"));
    }
    return list;
  }
}
