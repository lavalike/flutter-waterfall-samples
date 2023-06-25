import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// focus_container
/// Created by wangzhen on 2023/6/23

typedef Callback = void Function();
typedef FocusCallback = void Function(bool focus);

class FocusContainer extends StatefulWidget {
  final Widget child;
  final Callback? onTap;
  final FocusCallback? onFocusChange;
  final bool expand;
  final double radius;
  final bool border;
  final double scale;

  const FocusContainer({
    Key? key,
    required this.child,
    this.onTap,
    this.onFocusChange,
    this.expand = true,
    this.radius = 5,
    this.border = true,
    this.scale = 1.1,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FocusContainerState();
}

class _FocusContainerState extends State<FocusContainer>
    with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;
  late Tween<double> _tween;
  late AnimationController _controller;

  @override
  void initState() {
    _tween = Tween(begin: 1.0, end: widget.scale);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _focusNode.addListener(() {
      widget.onFocusChange?.call(_focusNode.hasFocus);
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

  _container() => RawKeyboardListener(
        onKey: _handleKey,
        focusNode: _focusNode,
        child: _focused ? _focusedChild() : widget.child,
      );

  _handleKey(RawKeyEvent event) {
    if (!isAllow(event)) return;
    if (event.data is RawKeyEventDataAndroid) {
      RawKeyEventDataAndroid dataAndroid = event.data as RawKeyEventDataAndroid;
      int code = dataAndroid.keyCode;
      if (code == 23 || code == 66) {
        widget.onTap?.call();
      }
    }
  }

  isAllow(RawKeyEvent event) {
    bool allow = true;
    if (event.data is RawKeyEventDataLinux) {
      bool isDown = (event.data as RawKeyEventDataLinux).isDown;
      allow = !isDown;
    } else if (event.data is RawKeyEventDataAndroid) {
      allow = event is RawKeyUpEvent;
    }
    return allow;
  }

  _focusedChild() {
    if (widget.border) {
      return Container(
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }
}
