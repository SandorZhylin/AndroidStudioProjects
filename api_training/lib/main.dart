import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ApiTraining());
}

class ApiTraining extends StatefulWidget {
  ApiTrainingState createState() => ApiTrainingState();
}

class ApiTrainingState extends State<ApiTraining> {
  String joke = 'Want to here a joke about Chuck?';
  bool isVisible = false;

  Future<String> getJoke() async {
    setState(() {
      isVisible = true;
    });
    var url = Uri.https('matchilling-chuck-norris-jokes-v1.p.rapidapi.com',
        '/jokes/random', {'q': '{http}'});

    var response = await http.get(url, headers: {
      "accept": "application/json",
      "x-rapidapi-key": "4d9efca2damshb443fb43e51a269p1a3f08jsnd3aad9e1e4e9",
      "x-rapidapi-host": "matchilling-chuck-norris-jokes-v1.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        isVisible = false;
      });
      return jsonResponse['value'];
    } else {
      print('Request failed with status: ${response.statusCode}.');

      return 'error';
    }
  }

  void fetchJoke() async {
    String newJoke = await getJoke();

    setState(() {
      joke = newJoke;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: buildButtonText(),
        ),
      ),
    );
  }

  Widget buildButtonText() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.orange,
                  width: 8,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Center(
                      child: Text('$joke'),
                    ),
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: isVisible,
                    child: SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 25,
              ),
              child: SizedBox(
                height: 100,
                width: 200,
                child: FloatingActionButton(
                  child: Text(
                    'Give me a joke!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    fetchJoke();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
