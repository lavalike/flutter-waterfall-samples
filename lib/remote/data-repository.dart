import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/entity/type_data.dart';

import '../entity/movie_data.dart';

/// data-repository
/// Created by wangzhen on 2023/6/22
class DataRepository {
  static provideMovies(int count) {
    List<MovieData> list = [];
    for (int i = 0; i < count; i++) {
      list.add(MovieData(title: "将夜", asset: "assets/images/night.jpg"));
    }
    return list;
  }

  static provideHots(int rows) {
    List<MovieData> list = [];
    for (int i = 0; i < rows; i++) {
      list.add(
          MovieData(title: "为万里晴空而战！", asset: "assets/images/fighter.jpeg"));
      list.add(MovieData(
          title: "碎骨化尘埃 浴血再重来", asset: "assets/images/perfect_world.jpg"));
      list.add(MovieData(
          title: "纵横天地随我心 唐三双神装登场", asset: "assets/images/douluo.png"));
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

  static provideMoviesTags() => [
        "勇闯险途",
        "科幻大片",
        "喜剧电影",
        "都市青春",
        "雷咚咚乐园",
        "军旅战争",
      ];

  static provideGuessMovies() => [
        MovieData(title: "", asset: "assets/images/night.jpg"),
        MovieData(title: "", asset: "assets/images/fighter.jpeg"),
        MovieData(title: "", asset: "assets/images/perfect_world.jpg"),
        MovieData(title: "", asset: "assets/images/douluo.png"),
        MovieData(title: "", asset: "assets/images/fighter.jpeg"),
      ];
}
