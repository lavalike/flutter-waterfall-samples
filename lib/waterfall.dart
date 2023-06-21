import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("waterfall"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
