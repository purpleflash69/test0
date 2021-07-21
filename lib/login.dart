import 'package:flutter/material.dart';
import 'package:side_bar/authservice.dart';
import 'forgot_password.dart';
import 'main.dart';
import 'maps.dart';
import 'profile.dart';
import 'services.dart';
import 'vehicleDetails.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

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

// ignore: must_be_immutable
class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  var mobile, password, token;
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
                            AuthService().login(mobile, password).then((val) {
                              if (val.data['success']) {
                                token = val.data['token'];
                                Navigator.pushNamed(context, '/home');
                                guestUser = false;
                              }
                            });
                          },
                        ),
                      ),
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

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  var name, customerid, mobile, password, token;

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
                            'NAME',
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
                          hintText: 'Enter Name here',
                        ),
                        onChanged: (val) {
                          name = val;
                        },
                      ),
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
                          customerid = val;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'MOBILE NUMBER',
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
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF282F62), fontSize: 15.0),
                          ),
                          onPressed: () {
                            AuthService()
                                .signup(name, customerid, mobile, password)
                                .then((val) {
                              if (val.data['success']) {
                                token = val.data['token'];
                                Navigator.pushNamed(context, '/home');
                                guestUser = false;
                              }
                            });
                          },
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

class Guest extends StatelessWidget {
  Guest({Key? key}) : super(key: key);
  var customerid, token;
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
                            AuthService().guest(customerid).then((val) {
                              if (val.data['success']) {
                                token = val.data['token'];
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
