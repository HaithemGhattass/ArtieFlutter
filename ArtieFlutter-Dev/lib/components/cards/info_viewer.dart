import 'package:flutter/material.dart';

class InfoViewer extends StatefulWidget {
  const InfoViewer({super.key});

  @override
  State<InfoViewer> createState() => _InfoViewerState();
}

class _InfoViewerState extends State<InfoViewer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(),
    );
  }
}
