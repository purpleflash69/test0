// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class AuthService {
//   Dio dio = new Dio();

//   login(mobile, password) async {
//     try {
//       return await dio.post('/*enter heroku link here*/',
//           data: {"mobile": mobile, "password": password},
//           options: Options(contentType: Headers.formUrlEncodedContentType));
//     } on DioError catch (e) {
//       Fluttertoast.showToast(
//         msg: e.response!.data['msg'],
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }

//   signup(name, customerid, mobile, password) async {
//     try {
//       return await dio.post('/*enter heroku url here*/',
//           data: {
//             "name": name,
//             "customerid": customerid,
//             "mobile": mobile,
//             "password": password
//           },
//           options: Options(contentType: Headers.formUrlEncodedContentType));
//     } on DioError catch (e) {
//       Fluttertoast.showToast(
//         msg: e.response!.data['msg'],
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }

//   guest(customerid) async {
//     try {
//       return await dio.post('/*enter heroku url here*/',
//           data: {
//             "customerid": customerid,
//           },
//           options: Options(contentType: Headers.formUrlEncodedContentType));
//     } on DioError catch (e) {
//       Fluttertoast.showToast(
//         msg: e.response!.data['msg'],
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }
// }
