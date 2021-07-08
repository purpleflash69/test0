import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textBoxBold(
  String str,
) {
  return Column(children: <Widget>[
    Text(
      str,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 24),
    ),
    SizedBox(height: 50),
  ]);
}

Widget textBox(
  String str,
) {
  return Column(
    children: <Widget>[
      Text(
        str,
        style: TextStyle(
            letterSpacing: 2,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black12),
      ),
      SizedBox(height: 10),
    ],
  );
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageName();
  }
}

class ImageName extends StatefulWidget {
  const ImageName({Key? key}) : super(key: key);

  @override
  _ImageNameState createState() => _ImageNameState();
}

class _ImageNameState extends State<ImageName> {
  final vehicleNumber = 'MH 12 AB 1234';
  final vehicleRegName = "John Doe";
  final modelNum = '12345';
  final regID = '#12345678';
  //Change all these variables in the future.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: textBoxBold("Vehicle-1"),
                ),
                Divider(
                  height: 0,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30,
                ),
                textBox('CUSTOMER ID'),
                textBoxBold(regID),
                textBox('VEHICLE NUMBER'),
                textBoxBold(vehicleNumber),
                textBox('VEHICLE REGISTERED UNDER NAME'),
                textBoxBold(vehicleRegName),
                textBox('MODEL NUMBER'),
                textBoxBold(modelNum),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 0,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
