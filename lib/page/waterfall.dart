import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/page/hot_movies.dart';
import 'package:flutter_waterfall_samples/page/video_types.dart';

import 'guess_movies.dart';
import 'section_title.dart';

/// waterfall
/// Created by wangzhen on 2023/6/25
class Waterfall extends StatefulWidget {
  const Waterfall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaterfallState();
}

class _WaterfallState extends State<Waterfall> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: _body(),
      );

  _body() => ListView(padding: const EdgeInsets.all(30), children: const [
        VideoTypes(),
        SizedBox(height: 15),
        SectionTitle(title: "猜你想看：精彩内容任你挑选"),
        SizedBox(height: 15),
        GuessMovies(),
        SizedBox(height: 15),
        SectionTitle(title: "热门推荐：最热影视抢先看"),
        SizedBox(height: 15),
        HotMovies(rows: 1),
        SectionTitle(title: "港迷专属：佳作好片一次睇个够！"),
        SizedBox(height: 15),
        HotMovies(rows: 2),
        SizedBox(height: 15),
        SectionTitle(title: "重磅推荐：精彩内容不容错过！"),
        SizedBox(height: 15),
        HotMovies(rows: 20),
      ]);
}
