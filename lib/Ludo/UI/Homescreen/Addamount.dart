// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart'as http;
// import 'package:ludo_score/Ludo/UI/Homescreen/gamepage.dart';
// import 'package:ludo_score/Ludo/UI/constant/api%20constant.dart';
// import 'package:ludo_score/Ludo/UI/constant/utilll.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:upi_india/upi_india.dart';
//
//
// class recharge extends StatefulWidget {
//   const recharge({Key? key}) : super(key: key);
//
//   @override
//   State<recharge> createState() => _rechargeState();
// }
//
// class _rechargeState extends State<recharge> {
//   Future<UpiResponse>? _transaction;
//   UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;
//
//   TextStyle header = TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       color: Colors.black
//   );
//
//   TextStyle value = TextStyle(
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//       color: Colors.black
//   );
//
//   @override
//   void initState() {
//     _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//       setState(() {
//         apps = value;
//       });
//     }).catchError((e) {
//       apps = [];
//     });
//     super.initState();
//   }
//
//   Future<UpiResponse> initiateTransaction(UpiApp app) async {
//
//     double long2 = double.parse(amount.toString());
//     print(long2);
//     print("long2");
//     print(double.parse(amount.toString()));
//     print("double.parse(amount.toString())");
//     return _upiIndia.startTransaction(
//       app: app,
//       receiverUpiId: "merchant969855.augp@aubank",
//       receiverName: '100X Bet',
//       transactionRefId: 'Razorpay0256',
//       transactionNote: '100x',
//       amount: long2,
//     );
//   }
//
//   Widget displayUpiApps() {
//     if (apps == null)
//       return Center(child: CircularProgressIndicator());
//     else if (apps!.length == 0)
//       return Center(
//         child: Text(
//           "No apps found to handle transaction.",
//            style: TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//             fontWeight: FontWeight.w900
//
//         ),
//         ),
//       );
//     else
//       return Align(
//         alignment: Alignment.topCenter,
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Wrap(
//             children: apps!.map<Widget>((UpiApp app) {
//               return GestureDetector(
//                 onTap:
//                 app.name=='PhonePe'?(){}:
//                     () {
//                   _transaction = initiateTransaction(app);
//                   setState(() {});
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.memory(
//                         app.icon,
//                         height: 60,
//                         width: 60,
//                       ),
//                       Text(app.name),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//   }
//
//   String _upiErrorHandler(error) {
//     switch (error) {
//       case UpiIndiaAppNotInstalledException:
//         return 'Requested app not installed on device';
//       case UpiIndiaUserCancelledException:
//         return 'You cancelled the transaction';
//       case UpiIndiaNullResponseException:
//         return 'Requested app didn\'t return any response';
//       case UpiIndiaInvalidParametersException:
//         return 'Requested app cannot handle the transaction';
//       default:
//         return 'Please Enter Amount';
//     }
//   }
//
//   void _checkTxnStatus(String status) {
//     switch (status) {
//       case UpiPaymentStatus.SUCCESS:
//
//       addmony();
//         print('Transaction Successful');
//         break;
//       case UpiPaymentStatus.SUBMITTED:
//         print('Transaction Submitted');
//         break;
//       case UpiPaymentStatus.FAILURE:
//         print('Transaction Failed');
//         break;
//       default:
//         print('Received an Unknown transaction status');
//     }
//   }
//
//   Widget displayTransactionData(title, body) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("$title: ", style: header),
//           Flexible(
//               child: Text(
//                 body,
//                 style: value,
//               )),
//         ],
//       ),
//     );
//   }
//   var wallet;
//
//
//
//
//
//  final TextEditingController amount = TextEditingController();
//   int _selectedItemIndex = 10; // Initialize with a value that won't match any index
//   bool _isButtonEnabled = false;
//   List<int> dataItems = [100, 500, 1000, 2000, 5000, 10000, 49999];
//
//   void _handleTextChange() {
//     setState(() {
//       _selectedItemIndex = 10; // Reset selected index
//       _isButtonEnabled = amount.text.isNotEmpty;
//     });
//   }
//
//   void _handleListItemSelected(int index) {
//     setState(() {
//       _selectedItemIndex = dataItems[index];
//       amount.text = dataItems[index].toString(); // Update TextFormField text
//       _isButtonEnabled = true;
//     });
//   }
//
//
//
//   @override
//   void dispose() {
//     amount.dispose();
//     super.dispose();
//   }
//
//   var catogery;
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.indigo[900],
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//
//       ),
//       body: ListView(
//           shrinkWrap: true,
//           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("ADD AMOUNT",
//                   // wallet==null?
//                   // Avilablebalance:Avilablebalancein+wallet['wallet'].toString(),
//                   style: GoogleFonts.playfairDisplay(textStyle: TextStyle(color: Colors.white,fontSize: 30)),
//                 )
//               ],
//             ),
//
//             SizedBox(
//               height: 30,
//             ),
//             Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(6))),
//               child: TextField(
//                 controller: amount,
//                 textAlign: TextAlign.start,
//                 keyboardType: TextInputType.number,
//                 style: GoogleFonts.playfairDisplay(textStyle: TextStyle(color: Colors.black)),
//                 onChanged: (text) {
//                   _handleTextChange();
//                   print(_handleTextChange);
//                   print(amount);
//                   print("amount");
//                 },
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(
//                       Icons.account_balance_wallet_rounded,
//                       color: Colors.grey,
//                     ),
//                     hintText: "Enter Recharge Ammount",
//                     helperStyle: GoogleFonts.playfairDisplay(textStyle: TextStyle(color: Colors.black)),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     )),
//                 cursorColor: Colors.grey,
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 130,
//                     childAspectRatio: 3.5 / 1.5,
//                     mainAxisSpacing: 5),
//                 itemCount: dataItems.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       _handleListItemSelected(index);
//                       print("_handleListItemSelected");
//                       print(_handleListItemSelected);
//                     },
//                     child: Stack(
//                       children: [
//                         Card(
//                           elevation: 5,
//
//                           color: _selectedItemIndex == dataItems[index] ? Colors.red: Colors.green,
//                           child: Center(
//                             child: Text(
//                               '₹  ' + dataItems[index].toString(),
//                               style: GoogleFonts.playfairDisplay(textStyle: TextStyle(color: Colors.white)),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                             top: 5,
//                             right: 5,
//                             child: _selectedItemIndex == dataItems[index]
//                                 ? Container(
//                               height: 12,
//                               width: 12,
//                               child: const CircleAvatar(
//                                 child: Icon(
//                                   Icons.check_outlined,
//                                   size: 10,
//                                 ),
//                               ),
//                             )
//                                 : Container()),
//                       ],
//                     ),
//                   );
//                 }),
//             SizedBox(
//               height: 30,
//             ),
//
//
//             _isButtonEnabled
//                 ?ListView(
//               shrinkWrap: true,
//               children: [
//                 Container(
//                   child: Center(child: Text("PAY USING",
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w900
//
//                     ),
//                   )),
//                 ),
//                 SizedBox(height: 20,),
//
//                 displayUpiApps(),
//                 FutureBuilder(
//                   future: _transaction,
//                   builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       if (snapshot.hasError) {
//                         return Center(
//                           child: Text(
//                             _upiErrorHandler(snapshot.error.runtimeType),
//                             style: header,
//                           ), // Print's text message on screen
//                         );
//                       }
//
//                       // If we have data then definitely we will have UpiResponse.
//                       // It cannot be null
//                       UpiResponse _upiResponse = snapshot.data!;
//
//                       // Data in UpiResponse can be null. Check before printing
//                       String txnId = _upiResponse.transactionId ?? 'N/A';
//                       String resCode = _upiResponse.responseCode ?? 'N/A';
//                       String txnRef = _upiResponse.transactionRefId ?? 'N/A';
//                       String status = _upiResponse.status ?? 'N/A';
//                       String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
//                       _checkTxnStatus(status);
//
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             displayTransactionData('Transaction Id', txnId,),
//                             displayTransactionData('Response Code', resCode),
//                             displayTransactionData('Reference Id', txnRef),
//                             displayTransactionData('Status', status.toUpperCase()),
//                             displayTransactionData('Approval No', approvalRef),
//                           ],
//                         ),
//                       );
//                     } else
//                       return Center(
//                         child: Text(''),
//                       );
//                   },
//                 )
//               ],
//             )
//                 :Container(),
//
//
//
//           ]),
//     );
//   }
// addmony()async {
//     print("vguyvuy");
//   final prefs = await SharedPreferences.getInstance();
//   final userid = prefs.getString("userId");
//     print("userid");
//     print(userid);
//
//
//     final response =  await http.post(Uri.parse(AppConstants.Addmoney),
//
//     headers:<String ,String>{
//       "Content-Type":"application/json; charset=UTF-8",
//     },
//     body: jsonEncode(<String ,String>{
//       "userid": '$userid',
//       "amount": amount.text,
//     }),
//   );
//   final data = jsonDecode(response.body);
//     print(response);
//   print(data);
//   print('qqqqqqqqqqqqqqqqqq');
//   if(data["status"]=='200'){
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Numberthree()));
//   }
//   else{
//
//     Utils.flushBarErrorMessage( data["msg"],context, Colors.white);
//   }
//
// }
// }