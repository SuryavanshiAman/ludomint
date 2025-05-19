import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ludo_score/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../audio.dart';
import '../constant/api constant.dart';
import 'package:http/http.dart' as http;

import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'apicontroller/invitefriendlist.dart';


class referralREFER extends StatefulWidget {
  const referralREFER({super.key});

  @override
  State<referralREFER> createState() => _referralREFERState();
}

class _referralREFERState extends State<referralREFER> {



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
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
          backgroundColor: Colors.black,
          child: Container(
            height: heights*0.6,
            width: widths*0.8,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(39),border: Border.all(color: Colors.yellow.shade800,width: 2)),
            child: Column(
                  children: [
                    // SizedBox(height:heights/30,),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          child: Image.asset(AppAsset.imagesCross, height: heights / 20),
                          onTap: () {
                            Audio.sound();
                            Navigator.pop(context);
                          }),
                    ),
                    Text("REFERRAL HISTORY",style: RighteousMedium.copyWith(fontSize: heights * 0.025, color: Colors.white)),
                    SizedBox(height: heights/40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Coins:",style: RighteousMedium.copyWith(fontSize: heights * 0.025, color: Colors.white)),
                        Consumer<ProfileViewModel>(
                            builder: (context,profileVM,child) {
                              final profileData= profileVM.profileModelData;
                              return Text(profileData?.data?.wallet==null?"":"${profileData?.data?.wallet}",style: RighteousMedium.copyWith(fontSize: heights * 0.025, color: Colors.black));
                            }
                        ),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widths/30,vertical: heights/45),
                      child: Container(
                        height: heights/17,
                        decoration: BoxDecoration(color:Color(0xff02518a),border: Border.all(color: Colors.white,width: 2)),
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
                    SizedBox(
                      height: heights/3,
                      width: widths/1.1,
                      // color: Colors.yellowAccent,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index){
                            return Container(
                              height: heights/15,
                              width: widths/4,
                              padding: EdgeInsets.all(8.0),
                              // color: Colors.teal,
                              child: Card(
                                color: Colors.indigo.shade300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    items[index].image==null?
                                    CircleAvatar(
                                      radius: heights/50,
                                      backgroundImage: const AssetImage(AppAsset.imagesEarnshare) ,
                                    ):CircleAvatar(
                                      radius: heights/50,
                                      backgroundImage:NetworkImage(AppConstants.imageurl+ items[index].image.toString()) ,
                                    ),
                                    SizedBox(width: widths/9,),
                                    SizedBox(
                                        height: heights/20,
                                        width: widths/4,
                                        // color: Colors.purple,
                                        child: Center(child: Text(items[index].username.toString(),
                                          style: RighteousRegular.copyWith(fontSize: heights * 0.020, color: Colors.white),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ))
                                    ),
                                    SizedBox(width: widths/10,),

                                    SizedBox(
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
        ),
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

