import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:side_bar/available_staions.dart';

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
          position: LatLng(22.7266875, 75.8061875),
          infoWindow: InfoWindow(
              title: 'Indore Airport',
              snippet:
                  'Devi Ahillyabai Holkar Airport Area, Indore, Madhya Pradesh 453112',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvailableStations()),
                );
              }),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('station 2'),
          position: LatLng(22.7208125, 75.8644375),
          infoWindow: InfoWindow(
              title: 'District Court Indore',
              snippet: 'New Siyaganj, Indore, Madhya Pradesh 452007',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvailableStations()),
                );
              }),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('station 3'),
          position: LatLng(22.7053125, 75.8793125),
          infoWindow: InfoWindow(
              title: 'Central Museum Indore',
              snippet:
                  'Near GPO Square, Residency, Navlakha, Indore, Madhya Pradesh 452001',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvailableStations()),
                );
              }),
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
        zoom: 12,
      ),
    ));
  }
}
