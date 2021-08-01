import 'package:flutter/material.dart';
import 'dart:html' as html;

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/balloons.png"),
                ),
              ),
              TextButton(
                onPressed: () {
                  html.window
                      .open('https://www.facebook.com/ICPCSCU', "_blank");
                },
                child: Text(
                  "SCU ICPC Community",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 15),
              ContributeButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class ContributeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        html.window.open(
            'https://github.com/Waelahmed99/Mostafa-Saad-smart-sheet',
            "_blank");
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.blue),
        )),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text("Contribute"),
      ),
    );
  }
}
