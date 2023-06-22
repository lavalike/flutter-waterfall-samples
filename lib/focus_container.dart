import 'package:flutter/material.dart';

/// focus_container
/// Created by wangzhen on 2023/6/23

typedef Callback = void Function();

class FocusContainer extends StatefulWidget {
  final Widget child;
  final Callback? onTap;

  const FocusContainer({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FocusContainerState();
}

class _FocusContainerState extends State<FocusContainer> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        bool hasFocus = _focusNode.hasFocus;
        if (hasFocus != _focused) {
          _focused = hasFocus;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _focused ? 1.1 : 1.0,
      child: InkWell(
        focusNode: _focusNode,
        onTap: () => widget.onTap?.call(),
        child: _focused ? _focusedChild() : widget.child,
      ),
    );
  }

  _focusedChild() => Container(
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: widget.child,
      );
}
