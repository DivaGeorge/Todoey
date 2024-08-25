import 'package:flutter/material.dart';

class Screen_profile extends StatelessWidget {
  const Screen_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("PRofile",
      style: TextStyle(
        fontSize: 100,
        fontWeight: FontWeight.w600,
        color: Colors.yellow,
      ),
      ),
      ),
    );
  }
}