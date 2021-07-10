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
        backgroundColor: Color(0xFF373374),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  'MOBILE NUMBER',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Card(
                  color: Color(0xFF252252),
                  margin: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 25,
                  ),
                  child: ListTile(
                    title: Text(
                      '+91 8019321710',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
                Text(
                  'OTP NUMBER',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10, top: 5),
                      height: 40,
                      width: 40,
                      color: Color(0xFF252252),
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                      height: 40,
                      width: 40,
                      color: Color(0xFF252252),
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                      height: 40,
                      width: 40,
                      color: Color(0xFF252252),
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                      height: 40,
                      width: 40,
                      color: Color(0xFF252252),
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
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
                        style:
                            TextStyle(color: Color(0xFF282F62), fontSize: 15.0),
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
    );
  }
}
