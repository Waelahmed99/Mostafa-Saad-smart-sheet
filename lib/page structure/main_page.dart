import 'package:flutter/material.dart';
import 'package:scoreboard/main.dart';
import 'package:scoreboard/page%20structure/header.dart';

import 'footer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SizedBox(height: 10),
        Expanded(
          child: HomePage(),
        ),
        SizedBox(height: 10),
        Footer(),
      ],
    );
  }
}
