import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../remote/data-repository.dart';
import '../focus/focus_container.dart';
import '../entity/type_data.dart';

/// video_types
/// Created by wangzhen on 2023/6/25
class VideoTypes extends StatefulWidget {
  const VideoTypes({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoTypeState();
}

class _VideoTypeState extends State<VideoTypes> {
  @override
  Widget build(BuildContext context) {
    List types = DataRepository.provideTypes();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1 / 0.4,
      ),
      itemCount: types.length,
      itemBuilder: (BuildContext context, int index) {
        return _typeItem(types[index]);
      },
    ).build(context);
  }

  _typeItem(TypeData data) => Container(
        margin: const EdgeInsets.only(top: 10),
        child: FocusContainer(
          onTap: () {
            Fluttertoast.showToast(msg: data.title);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white10,
            ),
            child: Center(
              child: Text(
                data.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      );
}
