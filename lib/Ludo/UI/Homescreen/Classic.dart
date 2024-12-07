// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ludomint/Ludo/UI/Homescreen/create_join_room_screen.dart';
import 'package:ludomint/Ludo/UI/Homescreen/money/Rechargeamount.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:ludomint/ludo_provider.dart';
import 'package:ludomint/main.dart';
import 'package:provider/provider.dart';

import '../../../audio.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/apiprofile.dart';
import 'jjellybutton.dart';

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
    final entryAmount = Provider.of<LudoProvider>(context, listen: false);
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString(); // Update TextFormField text
      _isButtonEnabled = true;
    });
    entryAmount.setEntryAmount(int.parse(amount.text));
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  var catogery;

  @override
  Widget build(BuildContext context) {
    final roomCode = Provider.of<LudoProvider>(context);
    return SafeArea(
        child: Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
        children: [
          Container(
            height: height * 0.68,
            width: width * 0.8,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade800, width: 3),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),

                Container(
                  height: height * 0.12,
                  width: width * 0.50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAsset.imagesWinam),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: TextField(
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      readOnly: true,
                      cursorColor: Colors.transparent,
                      controller: amount,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: RighteousMedium.copyWith(
                          fontSize: height * 0.030, color: Colors.white),
                      onChanged: (text) {
                        _handleTextChange();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                    child: Text("SELECT ENTRY AMOUNT",
                        style: RighteousMedium.copyWith(
                            fontSize: height * 0.019, color: Colors.white))),
                Divider(
                  color: Colors.yellow.shade800,
                  endIndent: 40,
                  indent: 40,
                  thickness: 1,
                ),
                SizedBox(height: height * 0.03),
                GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.04),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: (height * 0.12) / (height * 0.04)),
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
                            child: Text('₹${dataItems[index]}',
                                style: RighteousMedium.copyWith(
                                    fontSize: height * 0.019,
                                    color: Colors.white)),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                    child: Text("DEDUCTED FROM",
                        style: RighteousMedium.copyWith(
                            fontSize: height * 0.019, color: Colors.white))),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text("MAIN WALLET:${wallet ?? "₹0.0"}",
                          style: RighteousMedium.copyWith(
                              fontSize: height * 0.014, color: Colors.white)),
                    ),
                    Flexible(
                      child: Text(
                          bonus == null ? "₹0.0" : "BONUS WALLET: $bonus",
                          style: RighteousMedium.copyWith(
                              fontSize: height * 0.014, color: Colors.white)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.yellow.shade800,
                  endIndent: 40,
                  indent: 40,
                  thickness: 1,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                JellyButton(
                    color: CupertinoColors.activeOrange,
                    onTap: () {
                      Audio.sound();
                      if (amount.text.isNotEmpty && int.parse( wallet) >= int.parse(amount.text)) {
                        Provider.of<LudoProvider>(context, listen: false)
                            .createRoom(
                          context,
                        );

                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateJoinRoomScreen(status: "1")));
                          Utils.flushBarsuccessMessage(
                              "Room code generated: ${roomCode.roomCode}",
                              context,
                              Colors.white);
                        });
                      } else if(amount.text.isEmpty) {
                        Utils.flushBarsuccessMessage(
                            "First Select the Amount", context, Colors.white);
                      }else if ( int.parse( wallet) < int.parse(amount.text)){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  recharge()));
                        Utils.flushBarsuccessMessage(
                            "You have insuffecient balance", context, Colors.white);
                      }
                    },
                    title: "Create Room"),
                SizedBox(
                  height: height * 0.03,
                ),
                JellyButton(
                    color: CupertinoColors.activeOrange,
                    onTap: () {
                      Audio.sound();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateJoinRoomScreen(status: "2")));
                    },
                    title: "Join  Room"),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              child: Image.asset(AppAsset.imagesCross, height: height * 0.05),
              onTap: () {
                Audio.sound();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
