import 'package:flutter/material.dart';
import 'package:todoa/model/item_data.dart';
import 'package:todoa/widgets/tile_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(context),
          _buildBodyContent(),
          _buildBottomButton(),
        ],
      ),
    );
  }
}

Stack _buildTopBar(BuildContext context) {
  return Stack(
    children: [
      Container(
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/bg_header.png'),
          ),
        ),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          height: 20.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildBodyContent() {
  List<ItemData> items = [
    ItemData(
      isChecked: true,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 0',
    ),
    ItemData(
      isChecked: false,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 1',
    ),
    ItemData(
      isChecked: true,
      image: null,
      title: 'Item Text 2',
    ),
    ItemData(
      isChecked: false,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 3',
    ),
    ItemData(
      isChecked: false,
      image: 'assets/sample_avatar.png',
      title: 'Item Text 4',
    ),
  ];
  return Expanded(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: TileItem(
            isChecked: items[index].isChecked,
            title: items[index].title,
            image: items[index].image,
          ),
        );
      },
    ),
  );
}

Widget _buildBottomButton() {
  return Container(
    child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        height: 100,
        child: TextButton(
          onPressed: () => {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrange),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          child: Center(
            child: Text(
              'Add items',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
