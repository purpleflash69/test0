import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:side_bar/variables.dart';
import 'services.dart';

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

// Widget vehicleCheck(int vehicles, int num){
//   if(vehicles>num){return

//   }
//   else {}
// }

class VehicleDetailsPage extends StatelessWidget {
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

//new**
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  //NEW**

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Vehicle Details'),
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
                          child:
                              textBoxBold("Vehicle-" + (index + 1).toString()),
                        ),
                        Divider(
                          height: 0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        textBox('CUSTOMER ID'),
                        textBoxBold(snapshot.data!.data.vehicles[index].sId),
                        textBox('VEHICLE NUMBER'),
                        textBoxBold(
                            snapshot.data!.data.vehicles[index].registrationNo),
                        textBox('VEHICLE TYPE'),
                        textBoxBold(
                            snapshot.data!.data.vehicles[index].vehicleType),
                        textBox('MODEL NUMBER'),
                        textBoxBold(
                            snapshot.data!.data.vehicles[index].vehicleModel),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
