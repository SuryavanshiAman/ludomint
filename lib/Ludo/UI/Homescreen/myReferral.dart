// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/api constant.dart';
import 'package:http/http.dart' as http;

import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'apicontroller/invitefriendlist.dart';



class Myreferral extends StatefulWidget {
  const Myreferral({super.key});

  @override
  State<Myreferral> createState() => _MyreferralState();
}

class _MyreferralState extends State<Myreferral> {

  int ?responseStatuscode;

  @override
  void initState() {
    Referhistory();
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {


    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff005AA7),Color(0xffFFFDE4)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          child: Column(
            children: [
              SizedBox(height: heights/30,),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                       decoration: BoxDecoration(border: Border.all(color: Colors.yellow, width: 2),borderRadius: BorderRadius.circular(10),color: Colors.indigo),
                     child: InkWell(
                       onTap: (){
                         Navigator.pop(context);
                       },
                         child: const Icon(Icons.turn_left_outlined,color: Colors.yellowAccent,)
                     ),
               ),
              ),
              SizedBox(height: heights/30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Coins:",style: RighteousMedium.copyWith(fontSize: heights * 0.025, color: Colors.black)),
                  Text(wallet==null?"":wallet.toString(),style: RighteousMedium.copyWith(fontSize: heights * 0.025, color: Colors.black)),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widths/30,vertical: heights/35),
                child: Container(
                  height: heights/17,
                  decoration: BoxDecoration(color:Colors.indigo.shade900,border: Border.all(color: Colors.yellow,width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("No.",style: RighteousRegular.copyWith(fontSize: heights * 0.025, color: Colors.white)),
                      Text("Name",style: RighteousRegular.copyWith(fontSize: heights * 0.025, color: Colors.white)),
                      Text("Coins",style: RighteousRegular.copyWith(fontSize: heights * 0.025, color: Colors.white))
                    ],
                  ),
                  ),
              ),

              responseStatuscode== 400 ?
              const Notfounddata(): items.isEmpty? const Center(child: CircularProgressIndicator()):
              Container(
                height: heights/1.4,
                width: widths/1.1,
                decoration: BoxDecoration(border: Border.all(color: Colors.indigo.shade900,width: 2)),
                // color: Colors.yellowAccent,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return Container(
                        height: heights/15,
                        width: widths/4,
                        // color: Colors.teal,
                        child: Card(
                          color: Colors.indigo.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: widths/19,),
                              items[index].image==null?
                              CircleAvatar(
                                radius: heights/50,
                                backgroundImage: const AssetImage(AppAsset.imagesEarnshare) ,
                              ):CircleAvatar(
                                radius: heights/50,
                                backgroundImage:NetworkImage(AppConstants.imageurl+ items[index].image.toString()) ,
                              ),
                              SizedBox(width: widths/7),
                              Container(
                                  height: heights/20,
                                  width: widths/4,
                                  // color: Colors.purple,
                                  child: Center(child: Text(items[index].username.toString(),style: RighteousRegular.copyWith(fontSize: heights * 0.020, color: Colors.white),))
                              ),
                              SizedBox(width: widths/8,),
                              Container(
                                  height: heights/20,
                                  width: widths/9,
                                  // color: Colors.brown,
                                  child: Center(child: Text(items[index].bonus.toString(),style: RighteousRegular.copyWith(fontSize: heights * 0.020, color: Colors.white)))
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              )

            ],
          ),
          ),
        )
    );
  }
  List<invitefrndlistlist> items = [];

  Future<void> Referhistory() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");

    if (kDebugMode) {
      print("lllllllllllll");
      print(userId);
    }
    final response = await http.get(Uri.parse("${AppConstants.referhistory}$userId"),);
    // var data = jsonDecode(response.body);
    // print(data);

    setState(() {
      responseStatuscode = response.statusCode;
    });

    if (response.statusCode==200) {
      if (kDebugMode) {
        print("ooooooooooooo");
      }
      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        items = responseData.map((item) => invitefrndlistlist.fromJson(item)).toList();
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
        Text("Data not found",style: robotoRegular.copyWith(fontSize: width*0.03,color: Colors.white),)
      ],
    );
  }

}
