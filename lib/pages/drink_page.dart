import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({
    super.key,
    required String drinkName,
    required String drinkDescription,
  })  : _drinkName = drinkName,
        _drinkDescription = drinkDescription;

  final String _drinkName;
  final String _drinkDescription;

  String searchSplit(String drinkName) {
    List<String> splitName = drinkName.split(" ");
    String searchName = splitName.join("+");
    return searchName;
  }

  _launchUrl() async {
    //parsing url to uri
    final Uri url = Uri.parse(
        "https://www.danmurphys.com.au/search?searchTerm=${searchSplit(_drinkName)}");

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _drinkName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _drinkDescription,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(35),
                        backgroundColor: const Color.fromARGB(255, 0, 121, 107),
                        elevation: 5),
                    onPressed: _launchUrl,
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// search key is https://www.danmurphys.com.au/search?searchTerm=