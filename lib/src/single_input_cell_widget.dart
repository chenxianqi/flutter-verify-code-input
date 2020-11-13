import 'package:flutter/material.dart';
import 'custom_cursor_widget.dart';

class SingleCellWidget extends StatefulWidget {
  final String text;
  final bool isFocusedUnderline;
  final bool isShowCursor;
  final Color color;
  

  SingleCellWidget({
    this.text = "",
    this.isFocusedUnderline = false,
    this.isShowCursor = false,
    this.color = const Color(0xff1EE3CF)
  });

  @override
  State<StatefulWidget> createState() => _SingleCellWidgetState();
}

class _SingleCellWidgetState extends State<SingleCellWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width: 40,
            height: 45,
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  color: widget.isFocusedUnderline || widget.text.toString().isNotEmpty ? widget.color : Color(0xffDDDDDD).withAlpha(150),
                  width: 2),
            )),
            child: Center(
              child: Text(
                widget.text.toString(),
                style: TextStyle(fontSize: 22, color: widget.color),
              ),
            )),
        widget.isShowCursor ? CustomCursorWidget(color: widget.color,) : Container()
      ],
    );
  }
}
