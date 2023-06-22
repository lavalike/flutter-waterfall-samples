import 'package:flutter/material.dart';

/// focus_container
/// Created by wangzhen on 2023/6/23

typedef Callback = void Function();

class FocusContainer extends StatefulWidget {
  final Widget child;
  final Callback? onTap;
  final bool expand;

  const FocusContainer({
    Key? key,
    required this.child,
    this.onTap,
    this.expand = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FocusContainerState();
}

class _FocusContainerState extends State<FocusContainer>
    with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;
  final Tween<double> _tween = Tween(begin: 1.0, end: 1.1);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
      if (widget.expand) {
        if (_focused) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.expand
        ? ScaleTransition(
            scale: _tween.animate(_controller),
            child: _container(),
          )
        : _container();
  }

  _container() => InkWell(
        focusNode: _focusNode,
        onTap: () => widget.onTap?.call(),
        child: _focused ? _focusedChild() : widget.child,
      );

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
