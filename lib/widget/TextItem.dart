import 'package:flutter/material.dart';

class TextItem extends StatefulWidget {
  final String text;
  final double size;
  const TextItem({super.key, required this.text, required this.size});

  @override
  State<TextItem> createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontFamily: 'font',
        color: Colors.black,
        fontSize: widget.size,
      ),
    );
  }
}
