import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupi.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupipayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:ludo_score/cashfree_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import '../../constant/utilll.dart';


class addcash extends StatefulWidget {
  final amount;
  addcash({required this.amount});
  @override
  _addcashState createState() => _addcashState();
}

class _addcashState extends State<addcash> {

  // Future<UpiResponse>? _transaction;
  // UpiIndia _upiIndia = UpiIndia();
  // List<UpiApp>? apps;

  TextStyle header = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  TextStyle value = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black
  );

  @override
  void initState() {
    // _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
    //   setState(() {
    //     apps = value;
    //   });
    // }).catchError((e) {
    //   apps = [];
    // });
    super.initState();
  }

  // Future<UpiResponse> initiateTransaction(UpiApp app) async {
  //   var long2 = double.parse(widget.amount.toString());
  //   return _upiIndia.startTransaction(
  //     app: app,
  //     receiverUpiId: "merchant969855.augp@aubank",
  //     receiverName: '100X Bet',
  //     transactionRefId: 'Razorpay0256',
  //     transactionNote: '100x',
  //     amount: long2,
  //   );
  // }
  // Widget displayUpiApps() {
  //   if (apps == null)
  //     return const Center(child: CircularProgressIndicator());
  //   else if (apps!.length == 0)
  //     return const Center(
  //       child: Text(
  //         "No apps found to handle transaction.",
  //         style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white
  //         ),
  //       ),
  //     );
  //   else
  //     return Align(
  //       alignment: Alignment.topCenter,
  //       child: SingleChildScrollView(
  //         physics: const BouncingScrollPhysics(),
  //         child: Wrap(
  //           children: apps!.map<Widget>((UpiApp app) {
  //             return GestureDetector(
  //               onTap:
  //               app.name=='PhonePe'?(){}: () {
  //                 _transaction = initiateTransaction(app);
  //                 setState(() {});
  //               },
  //               child: Container(
  //                 height: 100,
  //                 width: 100,
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: <Widget>[
  //                     Image.memory(
  //                       app.icon,
  //                       height: 60,
  //                       width: 60,
  //                     ),
  //                     Text(app.name),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           }).toList(),
  //         ),
  //       ),
  //     );
  // }
  //
  // String _upiErrorHandler(error) {
  //   switch (error) {
  //     case UpiIndiaAppNotInstalledException:
  //       return 'Requested app not installed on device';
  //     case UpiIndiaUserCancelledException:
  //       return 'You cancelled the transaction';
  //     case UpiIndiaNullResponseException:
  //       return 'Requested app didn\'t return any response';
  //     case UpiIndiaInvalidParametersException:
  //       return 'Requested app cannot handle the transaction';
  //     default:
  //       return 'Please Enter Amount';
  //   }
  // }
  //
  // void _checkTxnStatus(String status) {
  //   switch (status) {
  //     case UpiPaymentStatus.SUCCESS:
  //
  //       // addmony();
  //       print('Transaction Successful');
  //       break;
  //     case UpiPaymentStatus.SUBMITTED:
  //       print('Transaction Submitted');
  //       break;
  //     case UpiPaymentStatus.FAILURE:
  //       print('Transaction Failed');
  //       break;
  //     default:
  //       print('Received an Unknown transaction status');
  //   }
  // }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
                body,
                style: value,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final upi=Provider.of<PaymentService>(context);
    return Column(
      children: <Widget>[
       isLoading==false? InkWell(
          onTap: (){
            addmony();
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>CashFreeGetwayScreen()));
          },
          child: Container(
            alignment: Alignment.center,
            width: width*0.7,
            height: height*0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text("Deposit", style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900
            ),),
          ),
        ):Center(child: CircularProgressIndicator(color: Colors.white,)),
        // InkWell(
        //   onTap: (){
        //     upi.payUsingUpiApp();
        //     // addmony();
        //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>CashFreeGetwayScreen()));
        //   },
        //   child: Container(
        //     alignment: Alignment.center,
        //     width: width*0.7,
        //     height: height*0.05,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(20)
        //     ),
        //     child: Text("upi", style: TextStyle(
        //         fontSize: 20,
        //         color: Colors.black,
        //         fontWeight: FontWeight.w900
        //     ),),
        //   ),
        // ),
        // Expanded(
        //   child: displayUpiApps(),
        // ),
        // Expanded(
        //   child: FutureBuilder(
        //     future: _transaction,
        //     builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         if (snapshot.hasError) {
        //           return Center(
        //             child: Text(
        //               _upiErrorHandler(snapshot.error.runtimeType),
        //               style: header,
        //             ), // Print's text message on screen
        //           );
        //         }
        //         // If we have data then definitely we will have UpiResponse.
        //         // It cannot be null
        //         UpiResponse _upiResponse = snapshot.data!;
        //         // Data in UpiResponse can be null. Check before printing
        //         String txnId = _upiResponse.transactionId ?? 'N/A';
        //         String resCode = _upiResponse.responseCode ?? 'N/A';
        //         String txnRef = _upiResponse.transactionRefId ?? 'N/A';
        //         String status = _upiResponse.status ?? 'N/A';
        //         String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
        //         _checkTxnStatus(status);
        //         return Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               displayTransactionData('Transaction Id', txnId,),
        //               displayTransactionData('Response Code', resCode),
        //               displayTransactionData('Reference Id', txnRef),
        //               displayTransactionData('Status', status.toUpperCase()),
        //               displayTransactionData('Approval No', approvalRef),
        //             ],
        //           ),
        //         );
        //       } else
        //         return const Center(
        //           child: Text(''),
        //         );
        //     },
        //   ),
        // )
      ],
    );
  }
bool isLoading=false;
  addmony()async {
    setState(() {
      isLoading=true;});
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    // final response =  await http.post(Uri.parse("https://root.ludomint.in/index.php/api/Mobile_app/payin"),
    final response =  await http.post(Uri.parse("https://root.ludomint.in/index.php/api/Mobile_app/createOrder"),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "userid": userid.toString(),
        "amount": widget.amount,
      }),
    );
    var data = jsonDecode(response.body);
    print(userid);
    print(data['intent_link']);
    print(data);
    // launchURL(data["intent_link"]);
    if(response.statusCode==200){
      String orderId = data["order_id"];
      String paymentSessionId = data["payment_session_id"];
Provider.of<PaymentService>(context,listen: false).setPaymentSessionIdAndOrderId(orderId, paymentSessionId, context);
Future.delayed(Duration(seconds: 3),(){
  Provider.of<PaymentService>(context,listen: false).payUsingUpiApp();
  setState(() {
    isLoading=false;});
});
      // Call Cashfree Payment Gateway
      // startCashfreePayment(orderId, paymentSessionId);
      // Utils.flushBarsuccessMessage( data["message"],context,Colors.white);
    }
    else{
      setState(() {
        isLoading=false;
    });
      Utils.flushBarErrorMessage( data["message"],context,Colors.white);
    }

  }
  var cfPaymentGatewayService = CFPaymentGatewayService();
  CFEnvironment environment = CFEnvironment.SANDBOX;
  // void startCashfreePayment(String orderId, String paymentSessionId) async {
  //   try {
  //     var session = CFSessionBuilder()
  //         .setEnvironment(environment)
  //         .setOrderId(orderId)
  //         .setPaymentSessionId(paymentSessionId)
  //         .build();
  //     // var paymentComponent = CFDropCheckoutPaymentBuilder()
  //     //     .setSession(session)
  //     //     .setPaymentComponent(CFPaymentComponent as CFPaymentComponent)
  //     //     .build();
  //     var upi = CFUPIBuilder().setChannel(CFUPIChannel.COLLECT).setUPIID("suhasg6@ybl").build();
  //     var upiPayment = CFUPIPaymentBuilder().setSession(session).setUPI(upi).build();
  //     cfPaymentGatewayService.doPayment(upiPayment);
  //   } on CFException catch (e) {
  //     print("Error: ${e.message}");
  //   }
  // }
  // void startCashfreePayment(String orderId, String paymentSessionId) async {
  //   try {
  //     String environment = "TEST"; // Use "PROD" for live payments
  //
  //     // Create a session map
  //     Map<String, dynamic> session = {
  //       "orderId": orderId,
  //       "paymentSessionId": paymentSessionId,
  //       "environment": environment
  //     };
  //
  //     // Set up event listeners before calling `doPayment`
  //     FlutterCashfreePgSdk.setEventListener((Map<dynamic, dynamic> response) {
  //       print("Cashfree Payment Response: $response");
  //
  //       if (response["status"] == "SUCCESS") {
  //         print("Payment Successful: ${response["orderId"]}");
  //         // Handle payment success (e.g., update database, show success message)
  //       } else {
  //         print("Payment Failed: ${response["reason"]}");
  //         // Handle payment failure (e.g., show error message)
  //       }
  //     });
  //
  //     // Start the Cashfree Payment after setting up the listener
  //     await FlutterCashfreePgSdk.doPayment(session);
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
  Future<void> launchUPI(String upiLink) async {
    Uri uri = Uri.parse(upiLink);
    debugPrint("Trying to launch UPI: $uri");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch UPI link: $uri");
    }
  }

}




