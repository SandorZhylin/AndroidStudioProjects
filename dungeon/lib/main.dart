import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'rooms_descriptions.dart';

void main() {
  runApp(Dungeon());
}

class Dungeon extends StatefulWidget {
  DungeonState createState() => DungeonState();
}

class DungeonState extends State<Dungeon> {
  RoomsDescriptions roomsDescriptions = RoomsDescriptions();
  String textWayDescription = 'Which way you would like to go?';
  String textRoomDescription =
      'So, your journey through the dungeon begins! You have to walk through 10 doors and stay alive! Simple as that! There are four doors in front of you: North, South, East and West...';
  int lives = 3;
  int openedRooms = 10;

  void journey() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              buildTopBar(),
              buildRoomText(context),
              buildMovementButtons(context),
              buildMovementText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopBar() {
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

  Widget buildRoomText(BuildContext context) {
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
          '$textRoomDescription',
          style: TextStyle(
            fontFamily: 'NewTegomin',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildMovementButtons(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 30.0,
          ),
          child: SizedBox(
            height: 80,
            width: 80,
            child: FloatingActionButton(
              child: Icon(
                Icons.arrow_upward_outlined,
                size: 35,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              backgroundColor: Colors.grey.shade600,
              onPressed: () {
                setState(
                  () {
                    textWayDescription = 'You went North.';
                    textRoomDescription = roomsDescriptions.get();
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  backgroundColor: Colors.grey.shade600,
                  onPressed: () {
                    setState(
                      () {
                        textWayDescription = 'You went West.';
                        textRoomDescription = roomsDescriptions.get();
                      },
                    );
                  },
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
              SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  backgroundColor: Colors.grey.shade600,
                  onPressed: () {
                    setState(
                      () {
                        textWayDescription = 'You went East.';
                        textRoomDescription = roomsDescriptions.get();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            child: Icon(
              Icons.arrow_downward_outlined,
              size: 35,
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: Colors.grey.shade600,
            onPressed: () {
              setState(
                () {
                  textWayDescription = 'You went South.';
                  textRoomDescription = roomsDescriptions.get();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMovementText(BuildContext context) {
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
              '$textWayDescription',
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
}
