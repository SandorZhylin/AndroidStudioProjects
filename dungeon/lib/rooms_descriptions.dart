import 'dart:math';

class RoomsDescriptions {
  List<String> roomsDescriptions = [
    'A gloomy dungeon, a bare brick wall, a collapsed ceiling in places, several doors leading in different directions.',
    'Apparently this is a former armory room. But everything has long been rusted and covered with dust.',
    'It looks like something was kept here, wooden shelves, sacks.',
    'Everything is in a spider web, Id rather get into another room.',
    'Drip-drip-drip - the sound of falling drops is heard. Damp and disgusting.',
    'Bare stone walls, it seems there is nothing here.',
    'It was a comora.',
    'Four walls, dry air, nothing special.',
    'An ordinary room four meters by four.',
    'This room is larger than usual, but it looks like there is nothing in it.',
    'Apart from the skeleton on the floor, there is nothing interesting.',
    'A long corridor at the end of which you can see doors.',
    'It looks like a guard room, several beds and a broken cauldron in the corner.',
    'An ordinary room, bare walls and a stone underfoot.'
  ];
  String get() {
    return roomsDescriptions
        .removeAt(Random().nextInt(roomsDescriptions.length));
    //return roomsDescriptions[(Random().nextInt(roomsDescriptions.length))];
  }
}
