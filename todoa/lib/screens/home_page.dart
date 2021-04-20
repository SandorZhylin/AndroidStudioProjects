import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todoa/model/tile_item.dart';
import 'package:todoa/screens/add_items_page.dart';
import 'package:todoa/widgets/item_data.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(context),
          _buildBodyContent(),
          _buildBottomButton(context),
        ],
      ),
    );
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
        Padding(
          padding: EdgeInsets.only(
            top: 35,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'TODOa:',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                ),
                speed: Duration(milliseconds: 250),
              ),
            ],
            totalRepeatCount: 1,
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
        image: null,
        title: 'Item Text 1',
      ),
      ItemData(
        isChecked: true,
        image: 'assets/sample_avatar.png',
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
              itemData: items[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          height: 100,
          child: TextButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItemsPage(),
                ),
              ),
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepOrange),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
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
}
