// ignore_for_file: unnecessary_null_comparison, file_names, non_constant_identifier_names, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../audio.dart';
import '../../constant/api constant.dart';
import '../../constant/images.dart';
import '../../constant/style.dart';
import '../../constant/utilll.dart';
import '../apicontroller/inviteAddfrnd.dart';


class Myaddfrnd extends StatefulWidget {
  const Myaddfrnd({super.key});
  // List<Myaddfrnd>? listdata;
  //   Myaddfrnd(this._listdata);

  @override
  State<Myaddfrnd> createState() => _MyaddfrndState();
}

class _MyaddfrndState extends State<Myaddfrnd> {

  String search ="";
  int ?responseStatuscode;

  bool  sound = true;
  bool loading = false;
  int _belowItemIndex = -5; // Initialize with a value that won't match any index




  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    searchh.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  final TextEditingController searchh = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: heights*0.06,
            width: widths*0.05,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade900),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: searchh,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration:  InputDecoration(
                  border: InputBorder.none,
                    hintText: "Search your frnds name",
                    suffixIcon: IconButton(
                      icon:  const Icon(Icons.close,color: Colors.white,size: 15),
                      onPressed: () {
                        setState(() {
                          searchh.clear();
                          search="";
                        });
                        fetchData();
                        Audio.sound();
                        },),
                    hintStyle: const TextStyle(color: Colors.white)
                  ),
                 onChanged: (value){
                  setState(() {
                    search = value;
                  });
                  fetchData();
                  },
              ),
            ),
          )

        ),

        responseStatuscode== 400 ?
       const Notfound(): items.isEmpty? const Center(child: CircularProgressIndicator()):
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  const EdgeInsets.only(left: 20,right: 20,top: 5),
              child: Container(
                // padding:  EdgeInsets.all(10.0),
                height: heights*0.06,
                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)),color: Colors.red[900]),
                child:ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child:
                    items[index].image==null?
                    CircleAvatar(
                      radius: heights/50,
                      backgroundImage: const AssetImage(AppAsset.imagesEarnshare) ,
                    ):CircleAvatar(
                      radius: heights/50,
                      backgroundImage:NetworkImage(AppConstants.imageurl+ items[index].image.toString()) ,
                    )
                  ),
                  title:Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(items[index].username.toString(),
                        style: RighteousMedium.copyWith(fontSize: heights * 0.019, color: Colors.white)),
                  ) ,
                  trailing:
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child:_belowItemIndex==items[index]?Center(child: CircularProgressIndicator()):
                    IconButton(
                        icon:
                        const Icon(Icons.add,size: 15,
                            color: Colors.white
                        ),
                      onPressed: () {
                        Audio.sound();
                        Addbutton(id: items[index].id.toString());
                        setState(() {
                          loading=true;
                        });
                      },),
                  )
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<invitefrnd> items = [];
  // invitefrnd selectedItem;


  Future<void> fetchData() async {

    // setState(() {
    //   loading = true;
    // });
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    final url = search == null? "${AppConstants.inviteadd}$userId":"${AppConstants.inviteadd}$userId&name=$search";

    if (kDebugMode) {
      print("hhhh");
    }
    final response = await http.get(Uri.parse(url));
    // var data = jsonDecode(response.body);
    // print(data);
    if (kDebugMode) {
      print(searchh.text);
    }
    if (kDebugMode) {
      print(url);
    }

    setState(() {
      responseStatuscode = response.statusCode;
    });

    if (response.statusCode==200) {


      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        items = responseData.map((item) => invitefrnd.fromJson(item)).toList();
        // selectedItem = items.isNotEmpty ? items.first : null; // Select the first item by default
      });
    }
    else if(response.statusCode==400){
      // setState(() {
      //   loading = false;
      // });

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

  Addbutton({required String id}) async {


    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    if (kDebugMode) {
      print("ddddddddddd");
    }

    final response = await http.post(Uri.parse(AppConstants.addfrnd),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "userid":userId.toString(),
          "friendid":id.toString()

        }));

    if (kDebugMode) {
      print("ddyyjjkjj");
    }

    var data = jsonDecode(response.body);

    if (data["error"] == "200") {

      setState(() {
        loading = false;
        fetchData();
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


}

class Notfound extends StatelessWidget {
  const Notfound({super.key});


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










