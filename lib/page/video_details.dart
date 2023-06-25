import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/page/section_title.dart';
import 'package:flutter_waterfall_samples/page/video_area.dart';
import 'package:flutter_waterfall_samples/page/video_types.dart';

import 'guess_movies.dart';
import 'hot_movies.dart';
import 'recommend_movies.dart';

/// video_details
/// Created by wangzhen on 2023/6/22
class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaterfallState();
}

class _WaterfallState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: _buildBody(),
    );
  }

  _buildBody() => ListView(padding: const EdgeInsets.all(30), children: const [
        VideoArea(),
        SizedBox(height: 10),
        VideoTypes(),
        SizedBox(height: 15),
        SectionTitle(title: "为你推荐"),
        SizedBox(height: 15),
        RecommendMovies(),
        SizedBox(height: 15),
        SectionTitle(title: "港迷专属：佳作好片一次睇个够！"),
        SizedBox(height: 15),
        HotMovies(rows: 2),
        SizedBox(height: 15),
        SectionTitle(title: "重磅推荐：精彩内容不容错过！"),
        SizedBox(height: 15),
        HotMovies(rows: 10),
      ]);
}
