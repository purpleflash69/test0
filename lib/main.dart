import 'package:flutter/material.dart';
import 'package:side_bar/available_staions.dart';
import 'package:side_bar/login.dart';
import 'package:side_bar/services.dart';
import 'profile.dart';
import 'variables.dart';
import 'vehicleDetails.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'about.dart';
import 'maps.dart';
import 'login.dart';
import 'forgot_password.dart';
import 'services.dart';

void main() => runApp(MyApp());
bool guestUser = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Signin(), //Chane to Sign in.
        '/signup': (context) => Signup(),
        '/signin': (context) => Signin(),
        '/guest': (context) => Guest(),
        '/forgot': (context) => ForgotPassword(),
        '/home': (context) => AppDrawer(),
        '/setpassword': (context) => SetPassword(),
        //'/otp': (context) => Otp(),
        '/available_Station': (context) => AvailableStations(),
      },
    );
  }
}

//New

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  AppDrawerState createState() => AppDrawerState();
}

//App drawer widget
class AppDrawerState extends State<AppDrawer> {
  String dropdownValue = 'Vehicle-1';
  bool chargeLessThan30popUp = true;
  //bool guestUser =
  //false; //True means that guest user is using the app, so profile and vehicle details page is restricted. Change it when a user logs in or sign up!!
  String voltage = "12 V";
  String minTemp = "27";
  String maxTemp = "35";
  // String serialNumber = "123456";
  String gaugeText = 'Charge in %';
  String gaugeTextForCharge = 'Charge in %';
  String gaugeTextForkWh = 'Kwh Left';
  double gaugeMinForCharge = 0;
  double gaugeMaxForCharge = 100;
  double gaugeMinForkWh = 0;
  double gaugeMaxForkWh = 10000;
  double gaugeCurrentForCharge = 31;
  // double gaugeCurrentForkWh = 5000;
  double gaugeMin = 0;
  double gaugeMax = 100;
  // double gaugeCurrent = 31; //This shows when the app is opened.

  double gaugeMinForRange = 0;
  double gaugeMaxForRange = 200;
  String gaugeTextForRange = 'Kms Left';
  // double gaugeCurrentForRange = 120;

  //for linear gauge
  double tempMax = 100;
  // double tempCurrent = 40;
  bool _temperature = false;
  double tempMin = 0;
  String gaugeTextForTemp = 'Temperature in celsius';

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    if (gaugeCurrentForCharge < 30 && chargeLessThan30popUp) {
      //new
      Future.delayed(Duration.zero, () => showAlert(context));
      //NEW
      chargeLessThan30popUp = false;
    }

    SfLinearGauge _temperatureGuage(double tempCurrent) {
      return SfLinearGauge(
        animateAxis: true,
        animationDuration: 2000,
        ranges: [
          LinearGaugeRange(
            startValue: tempMin,
            endValue: 0.33 * tempMax,
            color: Colors.green,
          ),
          LinearGaugeRange(
            startValue: 0.33 * tempMax,
            endValue: 0.66 * tempMax,
            color: Colors.yellow,
          ),
          LinearGaugeRange(
            startValue: 0.66 * tempMax,
            endValue: tempMax,
            color: Colors.red,
          )
        ],
        markerPointers: [LinearShapePointer(value: tempCurrent)],
      );
    }

    SfRadialGauge radialGauge(double gaugeCurr) {
      return SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 2000,
          axes: <RadialAxis>[
            RadialAxis(
                minimum: gaugeMin,
                maximum: gaugeMax,
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: gaugeMin,
                      endValue: .33 * gaugeMax,
                      color: Colors.red),
                  GaugeRange(
                      startValue: .33 * gaugeMax,
                      endValue: .66 * gaugeMax,
                      color: Colors.yellow),
                  GaugeRange(
                      startValue: .66 * gaugeMax,
                      endValue: gaugeMax,
                      color: Colors.green)
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: gaugeCurr,
                    enableAnimation: true,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Text(gaugeCurr.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))),
                      angle: 90,
                      positionFactor: 0.5)
                ])
          ]);
    }

    ListTile _sideBarSection(String label, IconData icon, Widget page) {
      //here page is the widget name that we want to navigate to, first import that file which contins that widget. Like I have imported Profile.dart.
      return ListTile(
        leading: Icon(icon),
        title: Text(
          label,
          style: TextStyle(fontSize: 17),
        ),
        onTap: () {
          // Update the state of the app.
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      );
    }

    ListTile _sideBarSectionWithCheckForGuestUser(
        String label, IconData icon, Widget page) {
      //here page is the widget name that we want to navigate to, first import that file which contins that widget. Like I have imported Profile.dart.
      return ListTile(
        leading: Icon(icon),
        title: Text(
          label,
          style: TextStyle(fontSize: 17),
        ),
        onTap: () {
          // Update the state of the app.

          if (guestUser) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Error!'),
                    content: Text(
                        'You are a guest user, you dont have access to this information. Please Log in or Sign up.'),
                    actions: [
                      Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue[900]),
                              ))),
                    ],
                    elevation: 24,
                  );
                });
          } else {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
      );
    }

    return FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //         if ( snapshot
            //               .data!.data.vehicles[index].batteryInformation.charge< 30 && chargeLessThan30popUp) {

            //   Future.delayed(Duration.zero, () => showAlert(context));

            //   chargeLessThan30popUp = false;
            // }
            if (isClicked) {
              gaugeCurrent = snapshot
                  .data!.data.vehicles[index].batteryInformation.charge
                  .ceilToDouble();
            }
            // snapshot.data!.id = ;
            // return Text(snapshot.data!.title);
            List<String> vehicles = [];
            for (var i = 1; i <= snapshot.data!.data.vehicles.length; i++) {
              vehicles.add("Vehicle-$i");
            }
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.gps_fixed),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Maps()));
                },
                backgroundColor: Colors.blue[900],
              ),
              appBar: AppBar(
                backgroundColor: Colors.blue[900],
                // title: Text(
                //   'Home',
                // ),
                title: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  // underline: Container(
                  //   height: 1,
                  //   color: Colors.white,
                  // ),
                  onChanged: (String? newValue) {
                    //Also update all the battery information and vehicle details page information too.
                    setState(() {
                      dropdownValue = newValue!;
                      if (!_temperature) {
                        gaugeCurrent = snapshot.data!.data.vehicles[index]
                            .batteryInformation.charge
                            .ceilToDouble();
                        gaugeText = gaugeTextForCharge;
                      }

                      if (newValue == "Vehicle-1") {
                        index = 0;
                        isClicked = true;
                        setState(() {});
                      }
                      if (newValue == "Vehicle-2" &&
                          snapshot.data!.data.vehicles.length >= 2) {
                        index = 1;
                        isClicked = true;

                        setState(() {});
                      }
                      if (newValue == "Vehicle-3" &&
                          snapshot.data!.data.vehicles.length >= 3) {
                        index = 2;
                        isClicked = true;

                        setState(() {});
                      }
                      if (newValue == "Vehicle-4" &&
                          snapshot.data!.data.vehicles.length >= 4) {
                        isClicked = true;

                        index = 3;
                        setState(() {});
                      }
                      if (newValue == "Vehicle-5" &&
                          snapshot.data!.data.vehicles.length >= 4) {
                        isClicked = true;

                        index = 4;
                        setState(() {});
                      }
                    });
                  },
                  dropdownColor: Colors.blue[700],
                  items: vehicles.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
                centerTitle: true,
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                      ),
                      child: ProfileImage(),
                    ),

                    //ALL THE SIDEBAR OPTIONS, instead of ProfilePage Widget in all the remaining arguments, use the correct page widget for the respective pages.

                    _sideBarSectionWithCheckForGuestUser(
                        "Profile", Icons.person, ProfilePage()),
                    _sideBarSection(
                        'Nearest Station',
                        Icons.battery_charging_full,
                        AvailableStations()), //NEW**
                    _sideBarSectionWithCheckForGuestUser("Vehicle Details",
                        Icons.list_alt_outlined, VehicleDetailsPage()),

                    // _sideBarSectionWithCheckForGuestUser(
                    //     "Change Password", Icons.password_outlined, ProfilePage()),

                    _sideBarSection('About', Icons.info, AboutPage()),

                    _sideBarSection('Log Out', Icons.logout, Signin())
                  ],
                ),
              ),
              body: ListView(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 270,
                    width: 270,
                    child: (_temperature
                        ? _temperatureGuage(snapshot.data!.data.vehicles[index]
                            .batteryInformation.temperature
                            .ceilToDouble()) //tempCurrent
                        : radialGauge(gaugeCurrent)),
                  ),
                ),
                Center(
                  child: Text(
                    gaugeText,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.battery_charging_full_outlined),
                          label: Text(
                            'Charge',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.blue[900],
                            padding: EdgeInsets.all(17),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _temperature = false;
                              gaugeMin = gaugeMinForCharge;
                              gaugeMax = gaugeMaxForCharge;
                              gaugeCurrent = snapshot.data!.data.vehicles[index]
                                  .batteryInformation.charge
                                  .ceilToDouble();
                              gaugeText = gaugeTextForCharge;
                              radialGauge(snapshot.data!.data.vehicles[index]
                                  .batteryInformation.charge
                                  .ceilToDouble());
                              isClicked = false;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.electrical_services_outlined),
                          label: Text(
                            'kWh',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.blue[900],
                            padding: EdgeInsets.all(17),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _temperature = false;
                              gaugeMin = gaugeMinForkWh;
                              gaugeMax = gaugeMaxForkWh;
                              gaugeCurrent = snapshot.data!.data.vehicles[index]
                                  .batteryInformation.kWh
                                  .ceilToDouble();
                              gaugeText = gaugeTextForkWh;
                              // radialGauge(snapshot.data!.data.vehicles[index]
                              //     .batteryInformation.kWh
                              //     .ceilToDouble());
                              print(snapshot.data!.data.vehicles[index]
                                  .batteryInformation.kWh);
                              isClicked = false;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.electric_bike_outlined),
                          label: Text(
                            'Range',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.blue[900],
                            padding: EdgeInsets.all(17),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _temperature = false;
                              gaugeMin = gaugeMinForRange;
                              gaugeMax = gaugeMaxForRange;
                              gaugeCurrent = snapshot.data!.data.vehicles[index]
                                  .batteryInformation.range
                                  .ceilToDouble();
                              gaugeText = gaugeTextForRange;
                              radialGauge(snapshot.data!.data.vehicles[index]
                                  .batteryInformation.range
                                  .ceilToDouble());
                              print(snapshot.data!.data.vehicles[index]
                                  .batteryInformation.range);
                              isClicked = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.thermostat_outlined),
                          label: Text(
                            'Temperature',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.blue[900],
                            padding: EdgeInsets.all(17),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              // tempCurrent = 50;
                              _temperature = true;
                              gaugeText = gaugeTextForTemp;
                              isClicked = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                'Battery Serial Number:',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                snapshot.data!.data.vehicles[index]
                                    .batteryInformation.serialNumber,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                            ])),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                'Min and Max Temperature:',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    minTemp, //Change with API value
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    maxTemp, //Change with API value and remove the variables e.g snapshot.data!.data.vehicles[index].batteryInformation.serialNumber

                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                            ])),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                'Battery Voltage:',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                voltage, //Change with API value and remove the variables e.g snapshot.data!.data.vehicles[index].batteryInformation.serialNumber
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15),
                            ])),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                //ADD THE NEW CONTAINERS HERE
              ]),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }

//NEW
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Low Vehicle Battery!'),
              content: Text(
                  'Your battery charge is less than 30% percent, do you want to navigate to Maps page?'),
              actions: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // chargeLessThan30popUp = false;
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue[900]),
                          )),
                      TextButton(
                          onPressed: () {
                            // chargeLessThan30popUp = false;
                            Navigator.pop(context);
                            //Navigate to maps page.
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Maps()));
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue[900]),
                          ))
                    ]),
              ],
              elevation: 24,
            ));
  }

  //NEW
}

class ProfileImage extends StatefulWidget {
  @override
  ProfileImageState createState() => ProfileImageState();
}

//A stateful widget to keep the profile image and name updated.
class ProfileImageState extends State<ProfileImage> {
  final imageURL =
      'https://image.shutterstock.com/image-vector/vector-profile-icon-600w-380603071.jpg';
  final name = "John Doe";
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
        radius: 50,
      ),
      Container(
        padding: EdgeInsets.all(20),
        child: Text(
          name, //USER PROFILE NAME IN SIDEBAR
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      )
    ]);
  }
}
