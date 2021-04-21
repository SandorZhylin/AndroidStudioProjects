import 'package:flutter/material.dart';
import 'package:todoa/model/tile_item.dart';

class DataCollection extends ChangeNotifier {
  List<ItemData> _items = [
    ItemData(
      isChecked: false,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 0',
    ),
    ItemData(
      isChecked: false,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 1',
    ),
    ItemData(
      isChecked: false,
      image: null,
      title: 'Item Text 2',
    ),
    ItemData(
      isChecked: false,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 3',
    ),
  ];

  int length() {
    return _items.length;
  }

  ItemData get(int index) {
    return _items[index];
  }

  void updateToDo(ItemData todo) {
    todo.isChecked = !todo.isChecked;

    notifyListeners();
  }

  void addToDo(String title) {
    _items.insert(0, ItemData(isChecked: false, title: title));

    notifyListeners();
  }

  void deleteToDo(int position) {
    notifyListeners();
  }
}
