import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/api constant.dart';
import '../../constant/images.dart';
import '../../constant/style.dart';
import '../apicontroller/invitefriendlist.dart';


class myfrndlist extends StatefulWidget {
  const myfrndlist({super.key});

  @override
  State<myfrndlist> createState() => _myfrndlistState();
}

class _myfrndlistState extends State<myfrndlist> {

  int ?responseStatuscode;


  @override
  void initState() {
    Allfrndlist();
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
        // FutureBuilder<List<invitefrndlistlist>>(
        //     future: que(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text('Error: ${snapshot.error}'),
        //         );
        //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //         return Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "Does not exist",
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 25,
        //                     color: Colors.white),
        //               ),
        //             ],
        //           ),
        //         );
        //       } else {
        //         return Padding(
        //           padding: EdgeInsets.symmetric(vertical: 20),
        //           child: ListView.builder(
        //             scrollDirection: Axis.vertical,
        //             shrinkWrap: true,
        //             itemCount: list.length,
        //             itemBuilder: (context, index) {
        //               return Padding(
        //                 padding: EdgeInsets.only(left: 20, right: 20, top: 5),
        //                 child: Container(
        //                   // padding:  EdgeInsets.all(10.0),
        //                   height: heights * 0.06,
        //                   decoration: BoxDecoration(
        //                       borderRadius:
        //                           BorderRadius.all(Radius.circular(10)),
        //                       color: Colors.red[900]),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Padding(
        //                         padding: EdgeInsets.symmetric(
        //                             horizontal: heights * 0.02),
        //                         child: Container(
        //                             height: heights * 0.6,
        //                             width: widths * 0.07,
        //                             decoration: BoxDecoration(
        //                                 image: DecorationImage(
        //                                     image: AssetImage(
        //                                         list[index].photo)))),
        //                       ),
        //                       RichText(
        //                         text: TextSpan(
        //                             text: list[index].name,
        //                             style: RighteousMedium.copyWith(
        //                                 fontSize: heights * 0.019,
        //                                 color: Colors.white)),
        //                       ),
        //                       IconButton(
        //                           onPressed: () {
        //                             // setState(() {
        //                             //   // list[index].isRemoved = true;
        //                             //
        //                             //
        //                             // });
        //                           },
        //                           icon: Icon(
        //                             Icons.notification_add,
        //                             size: 19,
        //                             color: Colors.white,
        //                           )),
        //                     ],
        //                   ),
        //                 ),
        //               );
        //             },
        //           ),
        //         );
        //       }
        //     }),

        responseStatuscode== 400 ?
        const Notfounddata(): items.isEmpty? const Center(child: CircularProgressIndicator()):
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Container(
                  // padding:  EdgeInsets.all(10.0),
                  height: heights * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.red[900]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      items[index].image==null?
                      CircleAvatar(
                        radius: heights/50,
                        backgroundImage: const AssetImage(AppAsset.imagesEarnshare) ,
                      ):CircleAvatar(
                        radius: heights/50,
                        backgroundImage:NetworkImage(AppConstants.imageurl+ items[index].image.toString()) ,
                      ),
                      RichText(
                        text: TextSpan(
                            text:  items[index].username,
                            style: RighteousMedium.copyWith(
                                fontSize: heights * 0.019,
                                color: Colors.white)),
                      ),
                      IconButton(
                          onPressed: () {
                          },
                          icon: Icon(
                            Icons.notification_add,
                            size: 19,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  List<invitefrndlistlist> items = [];

  Future<void> Allfrndlist() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");

    if (kDebugMode) {
      print("kklkkjhhgfyyfyt");
    }
    final response = await http.get(Uri.parse("${AppConstants.allfrnd}$userId"),);
    // var data = jsonDecode(response.body);
    // print(data);

    setState(() {
      responseStatuscode = response.statusCode;
    });

    if (response.statusCode==200) {
      if (kDebugMode) {
        print("kooooooo");
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
