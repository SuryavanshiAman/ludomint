import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upi_india/upi_india.dart';

import '../../constant/api constant.dart';
import '../../constant/images.dart';
import '../../constant/utilll.dart';
import '../apicontroller/money_controller.dart';
import '../gamepage.dart';
import 'add_cash.dart';


class recharge extends StatefulWidget {
  const recharge({Key? key}) : super(key: key);

  // final coinshop alldata;
  // recharge({required this.alldata});

  @override
  State<recharge> createState() => _rechargeState();
}

class _rechargeState extends State<recharge> {

  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

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
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    var long2 = double.parse(amount.toString());
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "merchant969855.augp@aubank",
      receiverName: '100X Bet',
      transactionRefId: 'Razorpay0256',
      transactionNote: '100x',
      amount: 10,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return const Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return const Center(
        child: Text(
          "No apps found to handle transaction.",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap:
                app.name == 'PhonePe' ? () {} : () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'Please Enter Amount';
    }
  }

  // void _checkTxnStatus(String status) {
  //   switch (status) {
  //     case UpiPaymentStatus.SUCCESS:
  //       addmony();
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

  var wallet;


  TextEditingController amount = TextEditingController();
  int _selectedItemIndex = 10; // Initialize with a value that won't match any index
  bool _isButtonEnabled = false;

  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10; // Reset selected index
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected({required int index, required String rupeess}) {
    setState(() {
      _selectedItemIndex = index;
      amount.text = rupeess;
      _isButtonEnabled = true;

    });
  }


  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }


    var catogery;
    @override
    Widget build(BuildContext context) {
      final width = MediaQuery
          .of(context)
          .size
          .width;
      final height = MediaQuery
          .of(context)
          .size
          .height;
      return Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          shrinkWrap: true,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.03),
            children: [
              FutureBuilder<List<coinshop>>(
                  future: que(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No coins are available",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.indigo[900]
                              ),
                            ),

                          ],
                        ),
                      );
                    }
                    else {
                      return Column(
                        children: [
                          Center(
                            child: Text("ADD AMOUNT",
                              style: GoogleFonts.playfairDisplay(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30)),
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Card(
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(6))),
                            child: TextField(
                              controller: amount,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (text) {
                                _handleTextChange();
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.account_balance_wallet_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Enter Recharge Amount",
                                  helperStyle:
                                  TextStyle(fontSize: height / 25,
                                      color: Colors.grey.shade200),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              cursorColor: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: (height * 0.16) / (height *
                                      0.05)
                              ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: () {

                                    _handleListItemSelected(
                                      index: index,
                                      rupeess: snapshot.data![index].rupees.toString(),
                                    );
                                    },
                                  child: Stack(
                                    children: [
                                      Card(
                                        elevation: 5,
                                        color: _selectedItemIndex ==
                                            index
                                            ? Colors.red
                                            : Colors.green,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: height*0.03,
                                              width: height*0.03,
                                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.buttonRupeeIcon,),fit: BoxFit.fill)),
                                            ),
                                            SizedBox(width: width*0.02),
                                            Center(
                                              child: Text(
                                                 '${snapshot.data![index].coins}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width / 25,
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          top: 5,
                                          right: 5,
                                          child: _selectedItemIndex ==
                                             index
                                              ? Container(
                                            height: height * 0.02,
                                            width: width * 0.05,
                                            child: const CircleAvatar(
                                              child: Icon(
                                                Icons.check_outlined,
                                                size: 10,
                                              ),
                                            ),
                                          )
                                              : Container()),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          _isButtonEnabled ?
                          Container(
                              height: height * 0.9,

                              child: addcash(amount: amount.text)) :
                          Container(

                          )
                        ],
                      );
                    }
                  }),

            ]),
      );
    }

    Future<List<coinshop>> que() async {
      final response = await http.get(
        Uri.parse(AppConstants.shopcoin),

      );
      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body)["data"] as List<dynamic>;
        if (kDebugMode) {
          print(jsondata);
          print("Aman:$jsondata");
        }
        return jsondata.map((item) => coinshop.fromJson(item)).toList();
      }
      else {
        throw Exception("failed to load");
      }
    }
    addmony() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.post(Uri.parse(AppConstants.Addmoney),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        "userid": '$userid',
        "amount": amount.text,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if (data["status"] == '200') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Numberthree()));
    }
    else {
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }
  }
  }







