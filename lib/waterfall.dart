import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/data-repository.dart';
import 'package:flutter_waterfall_samples/focus_container.dart';
import 'package:flutter_waterfall_samples/movie_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// waterfall
/// Created by wangzhen on 2023/6/22
class WaterfallPage extends StatefulWidget {
  const WaterfallPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaterfallState();
}

class _WaterfallState extends State<WaterfallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() => Container(
        color: Colors.blue.shade900,
        child: ListView(padding: const EdgeInsets.all(30), children: [
          _buildVideoAndInfo(),
          _buildTitle("相关推荐"),
          _buildRecommendMovies(),
        ]),
      );

  _buildTitle(String title) => Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ));

  _buildRecommendMovies() {
    List movies = DataRepository.provideMovies();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return _recommendMovieItem(movies[index]);
      },
    ).build(context);
  }

  _recommendMovieItem(MovieData data) => FocusContainer(
        onTap: () {
          Fluttertoast.showToast(msg: data.title);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  data.asset,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      );

  _buildVideoAndInfo() {
    return SizedBox(
      height: 270,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FocusContainer(
                expand: false,
                onTap: () => Fluttertoast.showToast(msg: "play video"),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/images/video_banner.jpg",
                          fit: BoxFit.cover),
                    ),
                    const Icon(
                      Icons.play_circle,
                      color: Colors.white60,
                      size: 35,
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "将夜",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Text(
                        "独播",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "全60集",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildTag("内地"),
                    const SizedBox(width: 5),
                    _buildTag("2018"),
                    const SizedBox(width: 5),
                    _buildTag("古装"),
                    const SizedBox(width: 5),
                    _buildTag("奇幻"),
                    const SizedBox(width: 5),
                    _buildTag("爱情"),
                  ],
                ),
                const SizedBox(height: 15),
                FocusContainer(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white10,
                  ),
                  child: const Text(
                    "讲述了大唐边军宁缺带着小侍女桑桑来到帝都，调查十三年前的灭门奇冤，经一番努力考入至高学府书院，步入世间强者之林。途中的种种磨难和困苦，让宁缺逐渐觉醒，识破了各种阴谋诡计、假象幻觉，勇往直前，杀敌救人，在书院同学和江湖人士帮助下，击杀各种敌人，并和桑桑双修，提升实力。",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildOperation(Icons.fullscreen, "全屏播放"),
                    const SizedBox(width: 10),
                    _buildOperation(Icons.payment, "开通VIP"),
                    const SizedBox(width: 10),
                    _buildOperation(Icons.update, "更新提醒"),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: FocusContainer(
                          child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white10,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "立即续费",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "畅享精彩内容",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTag(String text) => Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.withAlpha(100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 14,
          ),
        ),
      );

  _buildOperation(IconData icon, String text) => FocusContainer(
          child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ));
}
