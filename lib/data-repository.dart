import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/type_data.dart';

import 'movie_data.dart';

/// data-repository
/// Created by wangzhen on 2023/6/22
class DataRepository {
  static provideMovies() {
    List<MovieData> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(MovieData(title: "将夜", asset: "assets/images/night.jpg"));
    }
    return list;
  }

  static provideTypes() => [
        TypeData(title: "全部", color: Colors.lightBlue),
        TypeData(title: "科幻", color: Colors.red),
        TypeData(title: "爱情", color: Colors.orange),
        TypeData(title: "喜剧", color: Colors.pink),
        TypeData(title: "动作", color: Colors.purple),
        TypeData(title: "剧情", color: Colors.amber),
      ];
}
