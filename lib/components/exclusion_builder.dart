import 'package:flutter/material.dart';

class ExclusionBuilder extends StatelessWidget {
  const ExclusionBuilder({
    super.key,
    required this.typeList,
  });

  final List<String>? typeList;
  final double itemHeight = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: typeList!.length * itemHeight,
      child: ListView.builder(
        itemCount: typeList!.length,
        itemBuilder: (context, index) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  typeList![index],
                  style: TextStyle(fontSize: itemHeight * 0.7),
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
