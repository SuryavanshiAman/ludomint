import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Ludo/UI/constant/api constant.dart';
import 'package:http/http.dart' as http;

import 'Ludo/UI/constant/images.dart';
import 'Ludo/UI/constant/modal/depositmodel.dart';
import 'Ludo/UI/constant/style.dart';

class withdrawHistory extends StatefulWidget {
  const withdrawHistory({Key? key}) : super(key: key);

  @override
  State<withdrawHistory> createState() => _withdrawHistoryState();
}

class _withdrawHistoryState extends State<withdrawHistory> {

  int ?responseStatuscode;

  @override
  void initState() {
    Withdraw();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return
      responseStatuscode== 400 ?
      const Notfounddata(): items.isEmpty? const Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: heights*0.12,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade800, width: 2),borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date",style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                          Text("Credit",style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                        ],
                      ),
                      Divider(color: Colors.white,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(items[index].datetime.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                          Text(items[index].datetime==null?'not added':DateFormat("dd-MMM-yy, h:mm:ss a").format(
                              DateTime.parse(items[index].datetime.toString())),
                              style:RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)
                          ),

                          Text(items[index].amount.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white))
                        ],
                      ),
                      SizedBox(height: heights*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items[index].type.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                          Row(
                            children: [
                              Text("Status:",style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                              // Text(items[index].status.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.013, color: Colors.white)),
                              Text(
                                // items[index].status == "0" ? "Pending" : items[index].status == "1" ? "Success"
                                //     : items[index].status == "2"? "Reject" :"",
                                items[index].status == "0" ? "Pending" : items[index].status == "1" ? "Success"
                                    : "Reject",
                                style: RighteousMedium.copyWith(fontSize: heights * 0.013,
                                    color:
                                    items[index].status=="0"?Colors.red:items[index].status=="1"?
                                    Colors.yellowAccent: items[index].status=="2"?Colors.orangeAccent:Colors.pink
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                // child: ,
              ),
            );
          });
  }
  List<Depositmodel> items = [];

  Future<void> Withdraw() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");

    if (kDebugMode) {
      print("lllllllllllll");
      print(userId);
    }
    final response = await http.get(Uri.parse("${AppConstants.withdrawlhistory}$userId"),);
    // var data = jsonDecode(response.body);
    print(response);
    print("ytfufu");

    setState(() {
      responseStatuscode = response.statusCode;
    });

    if (response.statusCode==200) {
      if (kDebugMode) {
        print("ooooooooooooo");
        print(response.statusCode);
        print("ytfufu");
      }
      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        items = responseData.map((item) => Depositmodel.fromJson(item)).toList();
        // selectedItem = items.isNotEmpty ? items.first : null; // Select the first item by default
      });
    }
    else if(response.statusCode==400){
      if (kDebugMode) {
        print('Data not found');
      }
    }
    else {
      setState(() {
        items = [];
      });
      throw Exception('Failed to load data');
    }
  }
}
class Notfounddata extends StatelessWidget {
  const Notfounddata({super.key});


  @override
  Widget build(BuildContext context){
    final heights = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: heights*0.07),
        Image.asset(AppAsset.imagesDatanotfound,height: heights*0.09,width: width*0.20,fit: BoxFit.fill,),
        Text("Withdrawl not found",style: robotoRegular.copyWith(fontSize: width*0.03,color: Colors.white),)
      ],
    );
  }

}

