import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//void main() => runApp(MyApp());

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

class ProfilePage extends StatelessWidget {
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
  final imageURL =
      'https://image.shutterstock.com/image-vector/vector-profile-icon-600w-380603071.jpg';
  final email = "johndoe@gmail.com";
  final swaps = '10';
  final regID = '#12345678';
  final name = 'John Doe';
  final distance = '100 kms';
  final phNumber = "0123456789";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
                  height: 20,
                ),
                Center(
                    child: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                  radius: 60,
                )),
                Divider(
                  height: 50,
                  color: Colors.black,
                ),
                textBox('NAME'),
                textBoxBold(name),
                textBox('EMAIL ID'),
                textBoxBold(email),
                textBox('PHONE NUMBER'),
                textBoxBold(phNumber),
                textBox('BATTERY SWAPS'),
                textBoxBold(swaps),
                textBox('CUSTOMER ID'),
                textBoxBold(regID),
                textBox('TOTAL DISTANCE TRAVELLED'),
                textBoxBold(distance),
                textBox('PAYMENT HISTORY'),
                textBoxBold('500 Rs on 1/1/21'),
                textBoxBold('400 Rs on 2/2/21'),
                textBoxBold('400 Rs on 5/2/21'),
              ],
            ),
          )),
    );
  }
}
