import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          title: Text('Stations location on Map'),
          backgroundColor: Colors.indigo[900],
        ),
        body: SafeArea(child: MapPage()),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('station 1'),
          position: LatLng(22.7196, 75.8577),
          infoWindow: InfoWindow(
              title: 'WeSwap Station #1', snippet: 'address of the Station'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      markers: _markers,
      initialCameraPosition: CameraPosition(
        target: LatLng(22.7196, 75.8577),
        zoom: 15,
      ),
    ));
  }
}
