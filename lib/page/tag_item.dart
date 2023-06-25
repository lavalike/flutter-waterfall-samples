import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../focus/focus_container.dart';

/// tag_item
/// Created by wangzhen on 2023/6/25
class TagItem extends StatefulWidget {
  final String tag;

  const TagItem({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return FocusContainer(
      border: false,
      expand: false,
      radius: 20,
      onFocusChange: (hasFocus) {
        setState(() {
          focused = hasFocus;
        });
      },
      onTap: () {
        Fluttertoast.showToast(msg: widget.tag);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: focused ? Colors.white : Colors.transparent,
        ),
        child: Center(
          child: Text(
            widget.tag,
            style: TextStyle(
              color: focused ? Colors.black : Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
