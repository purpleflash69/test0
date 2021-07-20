import 'dart:async';
import 'dart:convert';
// import 'package:build_runner/build_runner.dart';
import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
// part 'service.g.dart';

Future<AlbumForAvailStat> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://fringuante-choucroute-25278.herokuapp.com/station/station/'));
  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumForAvailStat.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album ');
  }
}

class AlbumForAvailStat {
  late bool success;
  late Data data;
  late String message;

  AlbumForAvailStat(
      {required this.success, required this.data, required this.message});

  AlbumForAvailStat.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  late List<Stations> stations;

  Data({required this.stations});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stations'] != null) {
      stations = [];
      json['stations'].forEach((v) {
        stations.add(new Stations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stations != null) {
      data['stations'] = this.stations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stations {
  late String latitude;
  late String longitude;
  late String name;
  late String address;

  Stations(
      {required this.latitude,
      required this.longitude,
      required this.name,
      required this.address});

  Stations.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}
