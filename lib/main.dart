import 'package:flutter/material.dart';

import 'waterfall.dart';

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
      home: WaterfallPage(),
    );
  }
}
