import 'package:flutter/material.dart';
import 'package:siptemp/components/exclusion_builder.dart';
import 'package:siptemp/components/settings_tiles.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  final List<String>? typeList;
  const SettingsPage({super.key, required this.typeList});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _launchUrl() async {
    //parsing url to uri
    final Uri url = Uri.parse("https://ko-fi.com/jymmyboi");

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        //full body column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //expansion tiles column
            Column(
              children: [
                const SettingsTiles(
                  settingTitle: "LICENSE",
                  childText:
                      "This application is free under the GNU General Public License as published by the Free Software Foundation.",
                ),
                const SettingsTiles(
                  settingTitle: "Author",
                  childText:
                      "SipTemp is a creation by James Seton. An Aussie booze enthusiast by his own admission. He created this app as a way for people to experiment with the way they order/buy alcohol.",
                ),
                ExpansionTile(
                  title: const Text("I don't like: "),
                  children: [ExclusionBuilder(typeList: widget.typeList)],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: _launchUrl,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.coffee,
                      color: Color.fromARGB(255, 33, 33, 33),
                    ),
                    Text(
                      "Buy me a coffee",
                      style: TextStyle(color: Color.fromARGB(255, 33, 33, 33)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
