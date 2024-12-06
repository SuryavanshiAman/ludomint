// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../audio.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'jjellybutton.dart';
import 'matching.dart';


class Classic extends StatefulWidget {
  const Classic({Key? key}) : super(key: key);

  @override
  State<Classic> createState() => _ClassicState();
}

class _ClassicState extends State<Classic> {

  TextEditingController amount = TextEditingController();
  int _selectedItemIndex = -1;
  int _belowItemIndex = 1; // Initialize with a value that won't match any index
  bool _isButtonEnabled = false;
  List<int> dataItems = [1, 5, 10, 30, 100, 300, 500, 1000, 2000];
  List<int> belowItems = [1, 2, 3, 4];
  List<AssetImage> images = [];
  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10; // Reset selected index
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected(int index) {
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString(); // Update TextFormField text
      _isButtonEnabled = true;
    });
  }

  //circle avtar
  void _handleoneListItemSelected(int index) {
    setState(() {
      _belowItemIndex = belowItems[index];
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Dialog(
        backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
          child: Stack(
              children: [
                Container(
                  height: height*0.8,
                  width: width*0.8,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow.shade800, width: 3),
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height*0.10,),
                      Container(
                        height: height *0.12,
                        width: width*0.50,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWinam),fit: BoxFit.fill)),
                        child: Padding(
                          padding: EdgeInsets.only(top: height*0.04),
                          child: TextField(
                            decoration: const InputDecoration(border: InputBorder.none),
                            readOnly: true,
                            cursorColor: Colors.transparent,
                            controller: amount,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: RighteousMedium.copyWith(fontSize: height * 0.030, color: Colors.white),
                            onChanged: (text) {
                              _handleTextChange();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      Center(child: Text("SELECT ENTRY AMOUNT", style: RighteousMedium.copyWith(fontSize: height * 0.019,color: Colors.white))),
                      Divider(color: Colors.yellow.shade800,endIndent: 40,indent: 40,thickness: 1,),
                      SizedBox(height: height*0.03),
                      GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: height *0.04),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: (height*0.12)/(height*0.04)
                          ),
                          itemCount: dataItems.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Audio.classicmusic();
                                _handleListItemSelected(index);
                                },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _selectedItemIndex == dataItems[index]
                                        ? Colors.orangeAccent
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text('₹${dataItems[index]}', style: RighteousMedium.copyWith(fontSize: height * 0.019, color: Colors.white)),
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: height*0.02,),
                      Center(child: Text("DEDUCTED FROM",style: RighteousMedium.copyWith(fontSize: height * 0.019,color: Colors.white))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Text(wallet==null?"₹0.0":"MAIN WALLET: $wallet", style: RighteousMedium.copyWith(fontSize: height * 0.014, color: Colors.white)),
                          ),
                          Flexible(
                            child: Text(bonus==null?"₹0.0":"BONUS WALLET: $bonus", style: RighteousMedium.copyWith(fontSize: height * 0.014, color: Colors.white)),
                          ),
                        ],
                      ),
                      Divider(color: Colors.yellow.shade800,endIndent: 40,indent: 40,thickness: 1,),
                      // SizedBox(height: height*0.02,),
                      Center(child: Text("SELECT GOTI COLOUR", style: RighteousMedium.copyWith(fontSize: height * 0.022, color: Colors.white)),),
                      Container(
                        height: height *0.06,
                        width: width*0.38,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWingoti),fit: BoxFit.fill)),
                      ),
                      SizedBox(height: height*0.01,),
                      SizedBox(
                        width: width*0.45,
                        // color: Colors.yellowAccent,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 50,
                                childAspectRatio: (height*0.07)/(height*0.04),
                                mainAxisSpacing: 1
                            ),
                            itemCount: belowItems.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _handleoneListItemSelected(index);
                                    },
                                    child: CircleAvatar(
                                      radius: height / 30,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: height / 5,
                                        backgroundColor:
                                        _belowItemIndex == belowItems[index]
                                            ? Colors.red
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  _belowItemIndex == belowItems[index]
                                      ? const Center(
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.check_outlined,
                                          size: 20),
                                    ),
                                  )
                                      : Container(),
                                ],
                              );
                            }),
                      ),
                      SizedBox(height: height*0.03,),
                      JellyButton(
                          onTap: (){
                            Audio.sound();
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()),
                            // showDialog(context: context, builder: (context)=>Matching(selectedPrice:priceData));
                            showDialog(context: context, builder: (context)=>Matching(selectedPrice: _selectedItemIndex.toString()));
                            // showDialog(context: context, builder: (context)=>const Matching());
                          },
                          title: "PLAY"
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    child: Image.asset(AppAsset.imagesCross, height: height*0.05),
                    onTap: () {
                      Audio.sound();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                    top: height*0.04,
                    left: width*0.20,
                    child: Text("PLAY ONLINE", style: RighteousMedium.copyWith(fontSize: height * 0.028, color: Colors.white),
                    )),
              ],
            ),
          ));
  }
}
