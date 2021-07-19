import 'package:flutter/material.dart';
import 'payments.dart';
import 'data.dart';

class BatteryPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Battery'),
          backgroundColor: Colors.indigo[900],
        ),
        backgroundColor: Colors.indigo[900],
        body: SafeArea(
          child: AvailableBattery(),
        ),
      ),
    );
  }
}

class AvailableBattery extends StatefulWidget {
  const AvailableBattery({Key? key}) : super(key: key);

  @override
  _AvailableBatteryState createState() => _AvailableBatteryState();
}

class _AvailableBatteryState extends State<AvailableBattery> {
  String dataToChange = 'No battery';

  void changeData(int batteryNumber) {
    setState(() {
      dataToChange = batteryBrain.batteryBank[batteryNumber].batteryName;
    });
  }

  BatteryBrain batteryBrain = BatteryBrain();

  Expanded buildKey({required int batteryNumber}) {
    return Expanded(
      child: Card(
        child: ListTile(
          onTap: () {
            changeData(batteryNumber);
          },
          title: Text(batteryBrain.batteryBank[batteryNumber].batteryName),
          subtitle: Text(batteryBrain.batteryBank[batteryNumber].batteryStats),
          trailing: Text(batteryBrain.batteryBank[batteryNumber].batteryPrice),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _onPressed;

    if (dataToChange == 'No battery') {
      _onPressed = null;
    } else {
      _onPressed = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentsPage()),
        );
      };
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                'Station',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.indigo[800],
          child: ListTile(
            title: Text('current station'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                'Available Batteries',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.indigo[800],
          child: ListTile(
            title: Text('$dataToChange is selected'),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        buildKey(batteryNumber: 0),
        SizedBox(
          height: 10,
        ),
        buildKey(batteryNumber: 1),
        SizedBox(
          height: 10,
        ),
        buildKey(batteryNumber: 2),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: _onPressed,
          child: const Text(
            'PROCEED TO PAY',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        )
      ],
    );
  }
}
