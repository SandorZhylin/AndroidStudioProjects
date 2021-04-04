import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(dungeon());
}

class dungeon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            _buildTopBar(),
            _buildRoomText(),
            _buildMovementButtons(),
            _buildMovementText(),
          ],
        ),
      ),
    );
  }
}

Widget _buildTopBar() {
  return Container(
    height: 125,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/bg_icon.png'),
      ),
    ),
    child: Center(
      child: Text(
        'Dungeon',
        style: TextStyle(
          fontFamily: 'Bloody',
          color: Colors.red,
          fontSize: 130,
        ),
      ),
    ),
  );
}

Widget _buildRoomText() {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.shade600,
        width: 8,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
      ),
    ),
    child: Center(
      child: Text(
        'A room description will be added here in future.',
        style: TextStyle(
          fontFamily: 'NewTegomin',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _buildMovementButtons() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 30.0,
        ),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade600,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_upward_outlined),
            iconSize: 35,
            onPressed: () => {},
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                iconSize: 35,
                onPressed: () => {},
              ),
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_knight.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                iconSize: 35,
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_downward_outlined),
          iconSize: 35,
          onPressed: () => {},
        ),
      ),
    ],
  );
}

Widget _buildMovementText() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(
        top: 30,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade600,
            width: 8,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text(
            'A path direction will be added here in future.',
            style: TextStyle(
              fontFamily: 'NewTegomin',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
