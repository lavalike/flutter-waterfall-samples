import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/page/video_details.dart';

import 'page/waterfall.dart';

void main() {
  runApp(const MyApp());
}

/// main
/// Created by wangzhen on 2023/6/22
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Waterfall(),
    );
  }
}
