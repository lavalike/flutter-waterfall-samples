import 'package:flutter/material.dart';

/// section_title
/// Created by wangzhen on 2023/6/25
class SectionTitle extends StatefulWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> {
  @override
  Widget build(BuildContext context) => Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
}
