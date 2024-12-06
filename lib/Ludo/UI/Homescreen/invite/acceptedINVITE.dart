// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/api constant.dart';
import '../../constant/images.dart';
import '../../constant/style.dart';
import '../../constant/utilll.dart';
import '../apicontroller/inviteaccept.dart';


class Myaccepted extends StatefulWidget {
  const Myaccepted({super.key});

  @override
  State<Myaccepted> createState() => _MyacceptedState();
}

class _MyacceptedState extends State<Myaccepted> {


  int ?responseStatuscode;

  @override
  void initState() {
    Acceptedfrnd();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      children: [
        responseStatuscode== 400 ?
        const Datanotfound(): items.isEmpty? const Center(child: CircularProgressIndicator()):
        ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount:items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  const EdgeInsets.only(left: 10,right: 10,top: 5),
              child: Container(
                padding:  EdgeInsets.only(left: widths*0.01),
                height: heights*0.06,
                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)),color: Colors.red[900]),
                child: Row(
                  children: [
                    items[index].image==null?
                    CircleAvatar(
                      radius: heights/50,
                      backgroundImage: const AssetImage(AppAsset.imagesEarnshare) ,
                    ):CircleAvatar(
                      radius: heights/50,
                      backgroundImage:NetworkImage(AppConstants.imageurl+ items[index].image.toString()) ,
                    ),

                    Container(
                      width: widths*0.32,
                      margin: EdgeInsets.only(left: widths*0.01),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: items[index].username,
                            style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),
                          textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          Acceptrequest(id: items[index].id.toString());
                        },
                        icon: const Icon(Icons.check,size: 19,color: Colors.green,)
                    ),
                    IconButton(
                        onPressed: (){
                          Rejectrequest(id: items[index].id.toString());
                        },
                        icon: const Icon(Icons.close,size: 19,color: Colors.white,)
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }



  List<inviteaccepted> items = [];

  Future<void> Acceptedfrnd() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");

    if (kDebugMode) {
      print("hhhh");
    }
    final response = await http.get(Uri.parse("${AppConstants.acceptedfrnd}$userId"),);
    // var data = jsonDecode(response.body);
    // print(data);

    setState(() {
      responseStatuscode = response.statusCode;
    });

    if (response.statusCode==200) {
      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        items = responseData.map((item) => inviteaccepted.fromJson(item)).toList();
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


  Acceptrequest({required String id}) async {

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    if (kDebugMode) {
      print("ddddddddddd");
      print(userId);
      print(id);
    }
    final response = await http.post(Uri.parse(AppConstants.acceptinvite),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
           "userid":userId.toString(),
           "requestid":id.toString()

        }));

    if (kDebugMode) {
      print("ddyyjjkjj");
    }

    var data = jsonDecode(response.body);
    if (kDebugMode) {
      print(data);
      print("DFFFFFFFF");
    }

    if (data["error"] == "200") {

      setState(() {
        Acceptedfrnd();
      });
      if (kDebugMode) {
        print(data);
      }
      if (kDebugMode) {
        print('yyyyyyyyyyyy');
      }
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    } else {
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }
  }


  Rejectrequest({required String id}) async {

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    if (kDebugMode) {
      print("sssssssssss");
      print(userId);
      print(id);
    }
    final response = await http.post(Uri.parse(AppConstants.rejectinvite),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
           "userid":userId.toString(),
           "requestid":id.toString()

        }));

    if (kDebugMode) {
      print("fffffff");
    }

    var data = jsonDecode(response.body);
    if (kDebugMode) {
      print(data);
      print("kkkkkkkkk");
    }

    if (data["error"] == "200") {

      setState(() {
        Acceptedfrnd();
      });
      if (kDebugMode) {
        print(data);
      }
      if (kDebugMode) {
        print('yyyyyyyyggyyyy');
      }
      Utils.flushBarsuccessMessage(data["msg"], context, Colors.white);
    } else {
      Utils.flushBarErrorMessage(data["msg"], context, Colors.white);
    }
  }


}
class Datanotfound extends StatelessWidget {
  const Datanotfound({super.key});


  @override
  Widget build(BuildContext context){
    final heights = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: heights*0.07),
        Image.asset(AppAsset.imagesDatanotfound,height: heights*0.09,width: width*0.20,fit: BoxFit.fill,),
        Text("Data not found",style: robotoRegular.copyWith(fontSize: width*0.03,color: Colors.white),)
      ],
    );
  }

}

