import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfcard/cfcardlistener.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfcard/cfcardwidget.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfcard.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfcardpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupi.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupipayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfupi/cfupiutils.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ludo_score/Ludo/UI/constant/utilll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class PaymentService extends ChangeNotifier {
  var cfPaymentGatewayService = CFPaymentGatewayService();
  CFEnvironment environment = CFEnvironment.SANDBOX;
  String selectedId = "";
  CFCardWidget? cfCardWidget;
  String _paymentSessionId = "";
  String _orderId = "";
  String get orderId => _orderId;
  BuildContext? _context;

  String get paymentSessionId => _paymentSessionId;

  String _selectedPayType = "";
  setPaymentSessionIdAndOrderId(
      String orderId, String paymentId, BuildContext context) {
    print("setting data: $orderId || $paymentId");
    // _selectedPayType = type;
    _orderId = orderId;
    _paymentSessionId = paymentId;
    _context = context;
    initInvokedFunction();

    notifyListeners();
  }

  initInvokedFunction() {
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
    final GlobalKey<CFCardWidgetState> myWidgetKey =
        GlobalKey<CFCardWidgetState>();
    try {
      var session = createSession();
      cfCardWidget = CFCardWidget(
        key: myWidgetKey,
        textStyle: null,
        inputDecoration: InputDecoration(
          hintText: 'XXXX XXXX XXXX 1234',
          contentPadding: const EdgeInsets.all(15.0),
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
        ),
        cardListener: cardListener,
        cfSession: session,
      );
    } on CFException catch (e) {
      print(e.message);
    }
    CFUPIUtils().getUPIApps().then((value) {
      print("value");
      print(value);
      for (var i = 0; i < (value?.length ?? 0); i++) {
        var a = value?[i]["id"] as String;
        if (a.contains("cashfree")) {
          selectedId = value?[i]["id"];
        }
      }
      // payUsingUpiApp();
      // payUsingUpi();
    });
  }

  payUsingUpi() async {
    try {
      var session = createSession();
      var upi = CFUPIBuilder()
          .setChannel(CFUPIChannel.COLLECT)
          .setUPIID("tripathiji183-1@okaxis")
          .build();
      var upiPayment =
          CFUPIPaymentBuilder().setSession(session!).setUPI(upi).build();
      cfPaymentGatewayService.doPayment(upiPayment);
    } on CFException catch (e) {
      print("😶‍🌫️😶‍🌫️😶‍🌫️:${e.message}");
    }
  }

  payUsingUpiApp() async {
    try {
      cfPaymentGatewayService.setCallback(verifyPayment, onError);
      var session = createSession();
      var upi = CFUPIBuilder().setChannel(CFUPIChannel.INTENT_WITH_UI).build();
      var upiPayment =
          CFUPIPaymentBuilder().setSession(session!).setUPI(upi).build();
      cfPaymentGatewayService.doPayment(upiPayment);
    } on CFException catch (e) {
      print(e.message);
    }
  }

  payUsingCard() async {
    try {
      cfPaymentGatewayService.setCallback(verifyPayment, onError);
      var session = createSession();
      var card = CFCardBuilder()
          .setCardWidget(cfCardWidget!)
          .setCardExpiryMonth("08")
          .setCardExpiryYear("88")
          .setCardHolderName("Roronoa Zoro")
          .setCardCVV("888")
          .build();
      var cardPayment = CFCardPaymentBuilder()
          .setSession(session!)
          .setCard(card)
          .savePaymentMethod(true)
          .build();
      cfPaymentGatewayService.doPayment(cardPayment);
    } on CFException catch (e) {
      print("error is here: ${e.message}");
    }
  }

  CFSession? createSession() {
    try {
      var session = CFSessionBuilder()
          .setEnvironment(environment)
          .setOrderId(_orderId)
          .setPaymentSessionId(_paymentSessionId)
          .build();
      return session;
    } on CFException catch (e) {
      print(e.message);
    }
    return null;
  }

  void cardListener(CFCardListener cardListener) {
    print("Card Listener triggered");
    print(cardListener.getNumberOfCharacters());
    print(cardListener.getType());
    print(cardListener.getMetaData());
  }

  void receivedEvent(String event_name, Map<dynamic, dynamic> meta_data) {
    print(event_name);
    print(meta_data);
  }

  // err and success handling...
  void verifyPayment(String orderId) {
    print("Verify Payment");
    addmony(
      orderId,
    );
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    print(errorResponse.getMessage());
    showDialog(
        context: _context!,
        builder: (ctx) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Your payment request for order id: $orderId, has been failed, please try again later.",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    errorResponse.getMessage().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(_context!);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.04,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
    print("Error while making payment");
  }

  addmony(
    dynamic orderId,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.get(
      Uri.parse(
          "https://root.ludomint.in/index.php/api/Mobile_app/updatewallet?orderid=$orderId"),
    );
    var data = jsonDecode(response.body);
    print(userid);
    print("🫥🫥🫥");
    print(data);
    if (data["status"] == 200) {
      print(data["message"]);
      print("🫥🫥🫥");
      Fluttertoast.showToast(
        msg: data["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      print(data["message"]);
      print("😒😒😒😒😒");
      Fluttertoast.showToast(
        msg: data["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

    }
  }
}
//
