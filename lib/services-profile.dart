import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<AlbumProfile> fetchAlbumProfile() async {
  final response = await http.get(Uri.parse(
      'https://fringuante-choucroute-25278.herokuapp.com/user/user/60ee86f6f29ed838c8cc233e'));
  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumProfile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album ');
  }
}

class AlbumProfile {
  late bool success;
  late Data data;
  late String message;

  AlbumProfile(
      {required this.success, required this.data, required this.message});

  AlbumProfile.fromJson(Map<String, dynamic> json) {
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
  late Preloaded preloaded;
  late List<Vehicle> vehicle;
  late List<Payments> payments;

  Data(
      {required this.preloaded, required this.vehicle, required this.payments});

  Data.fromJson(Map<String, dynamic> json) {
    preloaded = (json['preloaded'] != null
        ? new Preloaded.fromJson(json['preloaded'])
        : null)!;
    if (json['vehicle'] != null) {
      vehicle = [];
      json['vehicle'].forEach((v) {
        vehicle.add(new Vehicle.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = [];
      json['payments'].forEach((v) {
        payments.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preloaded'] = this.preloaded.toJson();
    data['vehicle'] = this.vehicle.map((v) => v.toJson()).toList();
    data['payments'] = this.payments.map((v) => v.toJson()).toList();
    return data;
  }
}

class Preloaded {
  late String name;
  late String email;
  late int mobileNo;
  late int dateOfBirth;
  late String address;

  Preloaded(
      {required this.name,
      required this.email,
      required this.mobileNo,
      required this.dateOfBirth,
      required this.address});

  Preloaded.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileNo'] = this.mobileNo;
    data['dateOfBirth'] = this.dateOfBirth;
    data['address'] = this.address;
    return data;
  }
}

class Vehicle {
  late VehicleHistory vehicleHistory;
  late BatteryInformation batteryInformation;
  late String sId;
  late String registrationNo;
  late String vehicleType;
  late String vehicleModel;
  late int iV;

  Vehicle(
      {required this.vehicleHistory,
      required this.batteryInformation,
      required this.sId,
      required this.registrationNo,
      required this.vehicleType,
      required this.vehicleModel,
      required this.iV});

  Vehicle.fromJson(Map<String, dynamic> json) {
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
    if (this.vehicleHistory != null) {
      data['vehicleHistory'] = this.vehicleHistory.toJson();
    }
    if (this.batteryInformation != null) {
      data['batteryInformation'] = this.batteryInformation.toJson();
    }
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

class Payments {
  late String sId;
  late String transactionId;
  late String batteryId;
  late String stationId;
  late String customerId;
  late String timeStamp;
  late int amount;
  late int iV;

  Payments(
      {required this.sId,
      required this.transactionId,
      required this.batteryId,
      required this.stationId,
      required this.customerId,
      required this.timeStamp,
      required this.amount,
      required this.iV});

  Payments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    transactionId = json['transactionId'];
    batteryId = json['batteryId'];
    stationId = json['stationId'];
    customerId = json['customerId'];
    timeStamp = json['timeStamp'];
    amount = json['amount'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['transactionId'] = this.transactionId;
    data['batteryId'] = this.batteryId;
    data['stationId'] = this.stationId;
    data['customerId'] = this.customerId;
    data['timeStamp'] = this.timeStamp;
    data['amount'] = this.amount;
    data['__v'] = this.iV;
    return data;
  }
}
