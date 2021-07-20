import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentsPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payments'),
          backgroundColor: Colors.indigo[900],
        ),
        backgroundColor: Colors.indigo[900],
        body: SafeArea(
          child: Payments(),
        ),
      ),
    );
  }
}

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  late Razorpay razorpay;
  // TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_JtKuAyVPzTigO7",
      "amount": 250 * 100,
      // "amount": num.parse(textEditingController.text) * 100,
      "name": "WeSwap App",
      "description": "Payment for Battery",
      "prefill": {"contact": "1234567890", "email": "abc@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    Fluttertoast.showToast(
        msg: "Payment success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void handlerErrorFailure() {
    Fluttertoast.showToast(
        msg: "Payment error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void handlerExternalWallet() {
    Fluttertoast.showToast(
        msg: "External Wallet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     children: [
        //       Text(
        //         'Station',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 20,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Card(
        //   color: Colors.indigo[800],
        //   child: ListTile(
        //     title: Text('current station'),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     children: [
        //       Text(
        //         'Battery',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 20,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Card(
        //   color: Colors.indigo[800],
        //   child: ListTile(
        //     title: Text('Battery #'),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                'Amount to pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.indigo[800],
          child: ListTile(
            title: Text('Rs 250'),
          ),
        ),
        // Card(
        //   color: Colors.indigo[800],
        //   child: ListTile(
        //     title: Text('Rs 250'),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     controller: textEditingController,
        //     decoration: InputDecoration(hintText: "amount to pay"),
        //   ),
        // ),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            openCheckout();
          },
          child: const Text(
            'PAY NOW',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        )
      ],
    );
  }
}
