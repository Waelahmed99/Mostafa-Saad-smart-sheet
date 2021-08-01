import 'package:flutter/material.dart';
import 'package:scoreboard/main.dart';
import 'package:scoreboard/page%20structure/header.dart';

import 'footer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 10),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
