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
                textBoxBold("About Us"),
                // Divider(
                //   height: 0,
                //   color: Colors.black,
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                textBox(
                    " We are a battery swapping technology startup based in Indore, India. Our mission is :Together with people, we will catalyse the transition to sustainable electric mobility.We are currently in the conception phase and developing our prototypes with a target to launch pilot phase by starting of the next year and product launch in the following year with an initial investment of ₹100 million."),
                SizedBox(
                  height: 30,
                ),
                textBoxBold("Product"),
                textBox(
                    "Our idea is to create an ecosystem of universal battery swapping stations for electric vehicles to enhance the growth of EV in India. We are developing our own dedicated battery packs and swapping station technology for the same."),

                // textBoxBold(vehicleNumber),
                // textBox('VEHICLE REGISTERED UNDER NAME'),
                // textBoxBold(vehicleRegName),
                // textBox('MODEL NUMBER'),
                // textBoxBold(modelNum),
                // SizedBox(
                //   height: 20,
                // ),
                // Divider(
                //   height: 0,
                //   color: Colors.black,
                // ),
                SizedBox(
                  height: 30,
                ),
                textBoxBold("Version"),
                textBox("1.0.0"),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
