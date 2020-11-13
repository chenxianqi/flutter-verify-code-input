import 'dart:async';
import 'package:flutter/material.dart';

class CustomCursorWidget extends StatefulWidget {
   final Color color;
  @override
  State<StatefulWidget> createState() {
    return CustomCursorWidgetState();
  }
  CustomCursorWidget({this.color = const Color(0xff1EE3CF)});
}

class CustomCursorWidgetState extends State<CustomCursorWidget> {
  Timer _timer;
  Color _cursorColor = Color(0xff1EE3CF);
  bool _flag = false;

  @override
  void initState() {
    super.initState();
    _timer = _createTimer();
  }

  Timer _createTimer() {
    return Timer.periodic(Duration(milliseconds: 500), (t) {
      _flag = !_flag;
      _cursorColor = _flag ? Colors.transparent : widget.color;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 25,
      color: _cursorColor,
    );
  }
}
