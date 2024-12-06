import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../audio.dart';
import '../constant/api constant.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'apicontroller/money_controller.dart';

class Mymoney extends StatefulWidget {
  const Mymoney({super.key});

  @override
  State<Mymoney> createState() => _MymoneyState();
}

class _MymoneyState extends State<Mymoney> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                height: heights*0.6,
                width: widths*0.8,
                decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
                child: ListView(
                  shrinkWrap: true,
                  // physics: const ScrollPhysics(),
                  children: [
                    SizedBox(height: heights * 0.04,),
                    Center(child: Text("SHOP", style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (BuildContext context){
                            return Dialog(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
                              child: Container(
                                // height: heights*0.6,
                                width: widths*0.8,
                                decoration: BoxDecoration(border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40)),
                                child:
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          child: Image.asset(AppAsset.imagesCross, height: heights/20),
                                          onTap: () {
                                            Audio.sound();
                                            Navigator.pop(context);
                                          }),
                                    ),
                                    Text("Coming Soon",style: RighteousMedium.copyWith(fontSize: heights * 0.028, color: Colors.white,)),
                                    SizedBox(height: heights/20,),
                                    // Text("UPI",style: RighteousBold.copyWith(fontSize: heights * 0.025, color: Colors.white,)),
                                    // SizedBox(height: heights/50,),
                                    // Container(
                                    //   height: heights/26,
                                    //   width: widths/1.7,
                                    //   decoration: BoxDecoration(color:Colors.indigo.shade900,border: Border.all(color: Colors.white, width: 2),borderRadius: BorderRadius.circular(7)),
                                    //   // color: Colors.teal,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Container(
                                    //         // color: Colors.yellow,
                                    //         height: heights/30,
                                    //         width: widths/2,
                                    //         child: Center(child: Text(referalcode=='null'?"2526526":referalcode.toString(),style: RighteousMedium.copyWith(fontSize: heights* 0.018, color: Colors.white),)),
                                    //       ),
                                    //       // SizedBox(width: widths/10,),
                                    //       InkWell(
                                    //         onTap: (){
                                    //           copyToClipboard(referalcode=='null'?"2526526":referalcode.toString(),context);
                                    //         },
                                    //           child: const Icon(Icons.copy,color: Colors.white,)
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(height: heights*0.02,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   children: [
                                    //     InkWell(
                                    //       onTap: (){
                                    //         Launcher.openwhatsapp(context);
                                    //       },
                                    //       child: Container(
                                    //         height: heights/20,
                                    //         width: widths/9,
                                    //         decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesWhatsapp),fit: BoxFit.fill)),
                                    //       ),
                                    //     ),
                                    //     Text("QR CODE",style: RighteousBold.copyWith(fontSize: heights* 0.020, color: Colors.white)),
                                    //     InkWell(
                                    //       onTap: (){
                                    //       },
                                    //       child: Container(
                                    //         height: heights/20,
                                    //         width: widths/9,
                                    //         decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.buttonDownload),fit: BoxFit.fill)),
                                    //       ),
                                    //     ),
                                    //
                                    //   ],
                                    // ),
                                    // QrImageView(
                                    //   data: 'This QR code has an embedded image as well',
                                    //   version: QrVersions.auto,
                                    //   size: 200,
                                    //   gapless: false,
                                    //   embeddedImage: const AssetImage(AppAsset.imagesQrcodeorignal),
                                    //   embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(200, 200),
                                    //   ),
                                    // ),
                                    // Text("Make your payment",style: RighteousMedium.copyWith(fontSize: heights* 0.015, color: Colors.white))

                                  ],
                                ),
                              ),
                            );
                          });
                        },
                        child: FutureBuilder<List<coinshop>>(
                            future: que(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              }
                              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text(
                                        "No coins are available",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              }
                              else {
                                return   ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (BuildContext, int index) {
                                      return Card(
                                          child: Container(
                                            // color: Colors.red,
                                            height: heights * 0.06,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                // Container(
                                                //   height: heights*0.05,
                                                //   width: heights*0.05,
                                                //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(addAmount[index].photo,),fit: BoxFit.fill)),
                                                // ),
                                                Container(
                                                  height: heights*0.05,
                                                  width: heights*0.05,
                                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.buttonRupeeIcon),fit: BoxFit.fill)),
                                                ),
                                                Text( '${snapshot.data![index].coins}',style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.black)),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: heights*0.01),
                                                  child: Container(
                                                    width: widths*0.24,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
                                                    child:Center(child: Text( "₹ "+'${snapshot.data![index].rupees}',style: RighteousMedium.copyWith(fontSize: heights * 0.016, color: Colors.white))),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ));
                                    });
                              }
                            }),
                      ),
                    )
                  ],
                )),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                child: Image.asset(AppAsset.imagesCross,
                    height: heights / 20),
                onTap: () {
                  Audio.sound();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
    );
  }

Future<List<coinshop>> que()async{
    final response = await http.get(
      Uri.parse(AppConstants.shopcoin),

    );
    if(response.statusCode==200){
      final jsondata = json.decode(response.body)["data"]as List<dynamic>;
      if (kDebugMode) {
        print(jsondata);
      }
      return jsondata.map((item) => coinshop.fromJson(item)).toList();

      }
    else{
        throw Exception("failed to load");
    }
}
}

