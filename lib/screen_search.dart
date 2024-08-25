import 'package:flutter/material.dart';

class Screen_search extends StatelessWidget {
  Screen_search({super.key});

  final _list = [
    'Help',
    'About',
    'policy',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DropdownButtonFormField(
            items: _list.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (value) {
              print(value);
            }),
      ),
    );
  }
}
