import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_auth/email_auth.dart';

void main() {
  runApp(ForgotPassword());
}

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOtp() async {
    EmailAuth.sessionName = 'WeSwap';
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      Fluttertoast.showToast(
        msg: 'otp sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  bool verifyOtp() {
    return (EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _otpController.text));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFF545C9B),
            body: SafeArea(
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // CONTENT HERE
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
                            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              'Email.',
                              style: TextStyle(color: Colors.white, fontSize: 15.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              child: TextField(
                                controller: _emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  fillColor: Color(0xFF282F62),
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter email here',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.white),
                          child: TextButton(
                            child: Text(
                              'Send Otp',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF282F62), fontSize: 15.0),
                            ),
                            onPressed: () {
                              sendOtp();
                            }

                            //Navigator.pushNamed(context, '/otp');
                            ,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              'Enter OTP',
                              style: TextStyle(color: Colors.white, fontSize: 15.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: TextField(
                            controller: _otpController,
                            obscureText: false,
                            decoration: InputDecoration(
                              fillColor: Color(0xFF282F62),
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Enter OTP here',
                            ),
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
                                if (verifyOtp()) {
                                  Fluttertoast.showToast(
                                    msg: 'otp verified',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Get.to(SetPassword());
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'error',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }

                                // Navigator.pushNamed(context, '/setpassword');
                              }),
                        ),
                      ),
                    ],
                  ),
                ))));
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
                child: Expanded(
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
                            padding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              'New Password',
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
                            hintText: 'New Password',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              'Confirm Password',
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
                              /*Navigator.pushNamed(context, '/signin');*/
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
      ),
    );
  }
}
