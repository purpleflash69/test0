import 'dart:async';
import 'dart:convert';
// import 'package:build_runner/build_runner.dart';
import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
// part 'service.g.dart';

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://fringuante-choucroute-25278.herokuapp.com/vehicle/getVehicle/60ee86f6f29ed838c8cc233e'));
  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album ');
  }
}

class Album {
  late bool success;
  late Data data;
  late String message;

  Album({required this.success, required this.data, required this.message});

  Album.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data.toJson();
    data['message'] = this.message;
    return data;
  }
}

class Data {
  late List<Vehicles> vehicles;

  Data({required this.vehicles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['vehicles'] != null) {
      // ignore: deprecated_member_use
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles.add(new Vehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicles'] = this.vehicles.map((v) => v.toJson()).toList();
    return data;
  }
}

class Vehicles {
  late VehicleHistory vehicleHistory;
  late BatteryInformation batteryInformation;
  late String sId;
  late String registrationNo;
  late String vehicleType;
  late String vehicleModel;
  late int iV;

  Vehicles(
      {required this.vehicleHistory,
      required this.batteryInformation,
      required this.sId,
      required this.registrationNo,
      required this.vehicleType,
      required this.vehicleModel,
      required this.iV});

  Vehicles.fromJson(Map<String, dynamic> json) {
    vehicleHistory = (json['vehicleHistory'] != null
        ? new VehicleHistory.fromJson(json['vehicleHistory'])
        : null)!;
    batteryInformation = (json['batteryInformation'] != null
        ? new BatteryInformation.fromJson(json['batteryInformation'])
        : null)!;
    sId = json['_id'];
    registrationNo = json['registrationNo'];
    vehicleType = json['vehicleType'];
    vehicleModel = json['vehicleModel'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleHistory'] = this.vehicleHistory.toJson();
    data['batteryInformation'] = this.batteryInformation.toJson();
    data['_id'] = this.sId;
    data['registrationNo'] = this.registrationNo;
    data['vehicleType'] = this.vehicleType;
    data['vehicleModel'] = this.vehicleModel;
    data['__v'] = this.iV;
    return data;
  }
}

class VehicleHistory {
  late int noOfSwaps;
  late int totalRange;

  VehicleHistory({required this.noOfSwaps, required this.totalRange});

  VehicleHistory.fromJson(Map<String, dynamic> json) {
    noOfSwaps = json['noOfSwaps'];
    totalRange = json['totalRange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfSwaps'] = this.noOfSwaps;
    data['totalRange'] = this.totalRange;
    return data;
  }
}

class BatteryInformation {
  late String serialNumber;
  late int temperature;
  late int charge;
  late int kWh;
  late int range;

  BatteryInformation(
      {required this.serialNumber,
      required this.temperature,
      required this.charge,
      required this.kWh,
      required this.range});

  BatteryInformation.fromJson(Map<String, dynamic> json) {
    serialNumber = json['serialNumber'];
    temperature = json['temperature'];
    charge = json['charge'];
    kWh = json['kWh'];
    range = json['range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serialNumber'] = this.serialNumber;
    data['temperature'] = this.temperature;
    data['charge'] = this.charge;
    data['kWh'] = this.kWh;
    data['range'] = this.range;
    return data;
  }
}
