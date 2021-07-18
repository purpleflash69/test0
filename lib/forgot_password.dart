import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ForgotPassword());
}

class ForgotPassword extends StatelessWidget {
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            child: Text(
                              'Forgot Password',
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              'Mobile No.',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
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
                              'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF282F62), fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/otp');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            child: Text(
                              'Forgot Password',
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              'Enter OTP',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
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
                            hintText: 'Enter OTP here',
                          ),
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
                              'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF282F62), fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/setpassword');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class SetPassword extends StatelessWidget {
  const SetPassword({Key? key}) : super(key: key);

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
                            'Enter New Password',
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
                            'New Password',
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
                          hintText: 'New Password',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            'Confirm Password',
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
                            'Signin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF282F62), fontSize: 15.0),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                        ),
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
