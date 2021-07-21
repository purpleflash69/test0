import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  Future login(mobile, password) async {
    var response;
    /*try {*/
    response = await dio.post(
        'https://fringuante-choucroute-25278.herokuapp.com/auth/login/',
        data: {"customerId": mobile, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
    print(response) /*LoginAuth.fromJson(jsonDecode(response.body))*/;
    /* print(response);*/
    /*} on DioError catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }*/
  }

  signup(customerid, confirmpassword, password) async {
    try {
      return await dio.post('/*enter heroku url here*/',
          data: {
            "customerid": customerid,
            "confirmpassword": confirmpassword,
            "password": password
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response!.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  guest(customerid) async {
    try {
      return await dio.post('/*enter heroku url here*/',
          data: {
            "customerid": customerid,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response!.data['msg2'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

class LoginAuth {
  late bool success;
  late Data data;
  late String message;

  LoginAuth({required this.success, required this.data, required this.message});

  LoginAuth.fromJson(Map<String, dynamic> json) {
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
  late String customerId;
  late String name;
  late String email;

  Data({required this.customerId, required this.name, required this.email});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
