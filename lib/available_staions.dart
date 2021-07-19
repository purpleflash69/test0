import 'package:flutter/material.dart';

import 'battery.dart';
import 'data.dart';

class AvailableStations extends StatefulWidget {
  const AvailableStations({Key? key}) : super(key: key);

  @override
  _AvailableStationsState createState() => _AvailableStationsState();
}

class _AvailableStationsState extends State<AvailableStations> {
  String dataToChange = 'No station';

  void changeData(int stationNumber) {
    setState(() {
      dataToChange = stationBrain.stationBank[stationNumber].stationName;
    });
  }

  StationBrain stationBrain = StationBrain();

  Expanded buildKey({required int stationNumber}) {
    return Expanded(
      child: Card(
        child: ListTile(
          onTap: () {
            changeData(stationNumber);
          },
          title: Text(stationBrain.stationBank[stationNumber].stationName),
          subtitle:
              Text(stationBrain.stationBank[stationNumber].stationAddress),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _onPressed;

    if (dataToChange == 'No station') {
      _onPressed = null;
    } else {
      _onPressed = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BatteryPage()),
        );
      };
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          title: Text('Station'),
          backgroundColor: Colors.indigo[900],
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    'Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.indigo[800],
              child: ListTile(
                title: Text('$dataToChange is selected'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            buildKey(stationNumber: 0),
            SizedBox(
              height: 10,
            ),
            buildKey(stationNumber: 1),
            SizedBox(
              height: 10,
            ),
            buildKey(stationNumber: 2),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: _onPressed,
              child: const Text(
                'NEXT',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.white),
            )
          ],
        )),
      ),
    );
  }
}
