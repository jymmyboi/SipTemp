import 'package:flutter/material.dart';

class SettingsTiles extends StatefulWidget {
  final String settingTitle;
  final String childText;
  const SettingsTiles(
      {super.key, required this.settingTitle, required this.childText});

  @override
  State<SettingsTiles> createState() => _SettingsTilesState();
}

class _SettingsTilesState extends State<SettingsTiles> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.settingTitle),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(widget.childText),
        )
      ],
    );
  }
}
