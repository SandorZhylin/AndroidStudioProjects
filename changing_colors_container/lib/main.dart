import 'package:flutter/material.dart';

void main() {
  runApp(ChangingColor());
}

class ChangingColor extends StatefulWidget {
  @override
  _ChangingColorState createState() => _ChangingColorState();
}

class _ChangingColorState extends State<ChangingColor> {
  bool _pressedButton = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: _pressedButton ? Colors.white : Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.yellow,
              child: Text(
                'COLOR',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    _pressedButton = !_pressedButton;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
