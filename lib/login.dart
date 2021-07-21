import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:side_bar/authservice.dart';
import 'forgot_password.dart';
import 'main.dart';
import 'maps.dart';
import 'profile.dart';
import 'services.dart';
import 'vehicleDetails.dart';
import 'about.dart';
import 'package:http/http.dart' as http;
import 'authhttp.dart';
import 'authhttp2.dart';

/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Signin(),
        '/signup': (context) => Signup(),
        '/signin': (context) => Signin(),
        '/guest': (context) => Guest(),
        '/forgot': (context) => ForgotPassword(),
        '/home': (context) => AppDrawer(),
      },
    );
  }
}

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var mobile, password, token;
  Future save() async {
    var res = await http.post(
        Uri.parse(
            'https://fringuante-choucroute-25278.herokuapp.com/auth/login/'),
        headers: <String, String>{'Context-Type': 'application/json'},
        body: /*jsonEncode(*/
            <String, String>{"customerId": mobile, "password": password});
    /* print(res.statusCode);*/
    /* Navigator.pushNamed(context, '/home');
    guestUser = false;*/
    /*Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Dashboard()))*/
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF545C9B),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
                //maxHeight: MediaQuery.of(context).size.height,
                // maxWidth: MediaQuery.of(context).size.width,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // CONTENT HERE
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            'Let\'s Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'Mobile No.',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF282F62),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Enter Mobile no. here',
                        ),
                        onChanged: (val) {
                          mobile = val;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'PASSWORD',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF282F62),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.white),
                          child: TextButton(
                              child: Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF282F62), fontSize: 15.0),
                              ),
                              onPressed: () {
                                /* save();*/

                                save().then((res) {
                                  print(mobile);
                                  print(password);

                                  Map<String, dynamic> userMap =
                                      jsonDecode(res.body);
                                  var user = authhttp.fromJson(userMap);
                                  print(user.success);
                                  if (user.success) {
                                    Navigator.pushNamed(context, '/home');
                                    guestUser = false;
                                  }
                                });

                                /*if (response.success) {
                                print('SUCCESS');*/
                                /*token = val.data['token'];*/
                              })),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot');
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        child: Text(
                          'Forgot Password ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0))),
                        // child: ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //     minWidth: MediaQuery.of(context).size.aspectRatio,
                        //     minHeight: MediaQuery.of(context).size.shortestSide,
                        //   ),
                        //   child: IntrinsicHeight(
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                              child: Text(
                                'CREATE AN ACCOUNT?',
                                style: TextStyle(
                                    color: Color(0xFF282F62), fontSize: 15.0),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9FAFF),
                                    border: Border.all()),
                                child: TextButton(
                                  child: Text(
                                    'SIGN UP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF282F62),
                                        fontSize: 15.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                child: Text(
                                  '- OR -',
                                  style: TextStyle(
                                      color: Color(0xFF282F62), fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9FAFF),
                                    border: Border.all()),
                                child: TextButton(
                                  child: Text(
                                    'Guest Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF282F62),
                                        fontSize: 15.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/guest');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var mobile, confirmpassword, password, token;
  Future save() async {
    var res = await http.post(
        Uri.parse(
            'https://fringuante-choucroute-25278.herokuapp.com/auth/signup/'),
        headers: <String, String>{'Context-Type': 'application/json'},
        body: /*jsonEncode(*/
            <String, String>{"customerId": mobile, "password": password});
    /* print(res.statusCode);*/
    /* Navigator.pushNamed(context, '/home');
    guestUser = false;*/
    /*Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Dashboard()))*/
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF545C9B),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
                //maxHeight: MediaQuery.of(context).size.height,
                // maxWidth: MediaQuery.of(context).size.width,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // CONTENT HERE
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            'Create An Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'CUSTOMER ID',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF282F62),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'CUSTOMER ID here',
                        ),
                        onChanged: (val) {
                          mobile = val;
                        },
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'PASSWORD',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF282F62),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            ' CONFIRM PASSWORD',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF282F62),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Confirm Password',
                        ),
                        onChanged: (val) {
                          confirmpassword = val;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.white),
                        child: TextButton(
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF282F62), fontSize: 15.0),
                            ),
                            onPressed: () {
                              /* save();*/
                              if (confirmpassword == password) {
                                save().then((res) {
                                  print(mobile);
                                  print(password);
                                  print(res.body);

                                  Map<String, dynamic> userMap =
                                      jsonDecode(res.body);
                                  var user = authhttp2.fromJson(userMap);
                                  print(user.success);
                                  if (user.success) {
                                    Navigator.pushNamed(context, '/home');
                                    guestUser = false;
                                  }
                                });
                              }

                              /*if (response.success) {
                                print('SUCCESS');*/
                              /*token = val.data['token'];*/
                            }),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0))),
                        // child: ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //     minWidth: MediaQuery.of(context).size.aspectRatio,
                        //     minHeight: MediaQuery.of(context).size.shortestSide,
                        //   ),
                        //   child: IntrinsicHeight(
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                              child: Text(
                                'ALREADY HAVE AN ACCOUNT?',
                                style: TextStyle(
                                    color: Color(0xFF282F62), fontSize: 15.0),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9FAFF),
                                    border: Border.all()),
                                child: TextButton(
                                  child: Text(
                                    'SIGN IN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF282F62),
                                        fontSize: 15.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signin');
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                child: Text(
                                  '- OR -',
                                  style: TextStyle(
                                      color: Color(0xFF282F62), fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9FAFF),
                                    border: Border.all()),
                                child: TextButton(
                                  child: Text(
                                    'Guest Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF282F62),
                                        fontSize: 15.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/guest');
                                  },
                                  //vaja
                                ),
                              ),
                            ),
                          ],
                        ),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Guest extends StatefulWidget {
  const Guest({Key? key}) : super(key: key);

  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  var customerid, token;
  Future save() async {
    var res = await http.post(
        Uri.parse(
            'https://fringuante-choucroute-25278.herokuapp.com/user/user/guest'),
        headers: <String, String>{'Context-Type': 'application/json'},
        body: /*jsonEncode(*/
            <String, String>{"customerId": customerid});
    /* print(res.statusCode);*/
    /* Navigator.pushNamed(context, '/home');
    guestUser = false;*/
    /*Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Dashboard()))*/
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF545C9B),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
                //maxHeight: MediaQuery.of(context).size.height,
                // maxWidth: MediaQuery.of(context).size.width,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // CONTENT HERE
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            'Guest User Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'Customer ID',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF282F62),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Customer ID here',
                        ),
                        onChanged: (val) {
                          customerid = val;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.white),
                        child: TextButton(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF282F62), fontSize: 15.0),
                          ),
                          onPressed: () {
                            save().then((res) {
                              print(customerid);

                              Map<String, dynamic> userMap =
                                  jsonDecode(res.body);
                              var user = authhttp.fromJson(userMap);
                              print(user.success);
                              if (user.success) {
                                Navigator.pushNamed(context, '/home');
                                guestUser = true;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 85,
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0))),
                        // child: ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //     minWidth: MediaQuery.of(context).size.aspectRatio,
                        //     minHeight: MediaQuery.of(context).size.shortestSide,
                        //   ),
                        //   child: IntrinsicHeight(
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9FAFF),
                                    border: Border.all()),
                                child: TextButton(
                                  child: Text(
                                    'SIGN IN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF282F62),
                                        fontSize: 15.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signin');
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                child: Text(
                                  '- OR -',
                                  style: TextStyle(
                                      color: Color(0xFF282F62), fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9FAFF),
                                    border: Border.all()),
                                child: TextButton(
                                  child: Text(
                                    'SIGN UP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF282F62),
                                        fontSize: 15.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
