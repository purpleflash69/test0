import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:side_bar/services-profile.dart';
import 'package:side_bar/variables.dart';

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
  // final imageURL =
  //     'https://image.shutterstock.com/image-vector/vector-profile-icon-600w-380603071.jpg';

  late Future<AlbumProfile> futureAlbumProfile;

  @override
  void initState() {
    super.initState();

    futureAlbumProfile = fetchAlbumProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlbumProfile>(
        future: futureAlbumProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
                backgroundColor: Colors.blue[900],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        // Center(
                        //     child: CircleAvatar(
                        //   backgroundImage: NetworkImage(imageURL),
                        //   radius: 60,
                        // )),
                        // Divider(
                        //   height: 50,
                        //   color: Colors.black,
                        // ),
                        textBox('NAME'),
                        textBoxBold(snapshot.data!.data.preloaded.name),
                        textBox('EMAIL ID'),
                        textBoxBold(snapshot.data!.data.preloaded.email),
                        textBox('PHONE NUMBER'),
                        textBoxBold(
                            snapshot.data!.data.preloaded.mobileNo.toString()),
                        textBox('CUSTOMER ID'),
                        textBoxBold(snapshot.data!.data.vehicle[index].sId),
                        textBox('TOTAL VEHICLES'),
                        textBoxBold(
                            snapshot.data!.data.vehicle.length.toString()),
                        textBox('LAST PAYMENT'),
                        textBoxBold(
                            snapshot.data!.data.payments[0].amount.toString() +
                                "/-Rs"),

                        textBox("TRANSACTION ID"),
                        textBoxBold(snapshot
                            .data!.data.payments[0].transactionId
                            .toString()),
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
