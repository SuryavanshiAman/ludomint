import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ludomint/ludo_provider.dart';
import 'package:ludomint/view_model/create_joine_view_model.dart';
import 'package:ludomint/view_model/firebase_view_model.dart';
import 'package:provider/provider.dart';

class CreateJoinRoomScreen extends StatefulWidget {
  const CreateJoinRoomScreen({super.key});

  @override
  State<CreateJoinRoomScreen> createState() => _CreateJoinRoomScreenState();
}

class _CreateJoinRoomScreenState extends State<CreateJoinRoomScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CreateJoinViewModel>(context, listen: false).clearData(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final cJVMCon = Provider.of<CreateJoinViewModel>(context);
    final ludo = Provider.of<LudoProvider>(context);
    return  Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Stack(
        children: [
          Container(
            height: heights*0.6,
            width: widths*0.8,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration( color: Colors.black,border: Border.all(color: Colors.yellow.shade800, width: 3),borderRadius: BorderRadius.circular(40),),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: heights/25,),
                Text("Play with friends!", style:TextStyle(fontSize: heights * 0.025, color: Colors.white),),
                SizedBox(height: heights / 80),
                Text("Create an room to play with your friends, share room code with your friends and start game.", style: TextStyle(fontSize: heights * 0.020, color: Colors.white),),
                SizedBox(height: heights / 80),
                Text("Click on join room enter valid room code and start the game.", style: TextStyle(fontSize: heights * 0.020, color: Colors.white),),
                SizedBox(height: heights/24,),
                if(cJVMCon.generatedRoomCode.isEmpty)
                  joinWithRoomCode(),

                const SizedBox(height: 10,),
                generateRoomAndStartGame()
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                // Audio.sound();
                Navigator.pop(context);
              },
              child: Container(
                height: heights / 20,
                width: widths / 10,
                color: Colors.yellow,
                // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imagesCross), fit: BoxFit.fill)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  final joinRoomCon = TextEditingController();
  Widget shareRoomCode(){
    final cJVMCon = Provider.of<CreateJoinViewModel>(context);
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(height: 25,),
        Text("Room Code", style: TextStyle(fontSize: heights * 0.018, color: Colors.yellow,),),
        SizedBox(height: heights / 80),
        Container(
          height: heights / 26,
          width: widths / 2.5,
          color: Colors.indigo.shade900,
          child: Row(
            children: [
              SizedBox(
                height: heights / 30,
                width: widths / 3,
                child: Center(child: Text(cJVMCon.generatedRoomCode, style: TextStyle(fontSize: heights * 0.018, color: Colors.white))),
              ),
              SizedBox(
                height: heights / 30,
                width: widths / 15,
                child: InkWell(
                  onTap: () {
                    // copyToClipboard(cJVMCon.generatedRoomCode, context);
                  },
                  child: const Icon(
                    Icons.content_copy,
                    color: Colors.white,
                    size: 20,
                  ),

                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        InkWell(
          onTap: (){
            // share();
          },
          child: Container(
              height: heights/25,
              width: widths/3,
              decoration: BoxDecoration(color: CupertinoColors.activeOrange,borderRadius: BorderRadius.circular(39)),
              child: Center(
                  child: Text("Share room code", style: TextStyle(fontSize: heights * 0.018, color: Colors.white))
              )
          ),
        ),
      ],
    );
  }

  Widget joinWithRoomCode(){
    final cJVMCon = Provider.of<CreateJoinViewModel>(context);
    final ludo = Provider.of<LudoProvider>(context);
    final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return Column(
      children: [
        TextField(
          controller: joinRoomCon,
          decoration: InputDecoration(
              hintText: "Enter room code here...",
              constraints: BoxConstraints(
                maxWidth: widths/1.5,
                maxHeight: 45,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),

              ),
              fillColor: Colors.white,
              filled: true
          ),
        ),
        const SizedBox(height: 10,),
        if(joinRoomCon.text.isNotEmpty)
          InkWell(
            onTap: (){
              ludo.joinRoom(context,joinRoomCon.text.trim()).then((value){
                cJVMCon.navigateToWaitingScreen(context, joinRoomCon.text.trim());

              });
            },
            child: Container(
                height: 35,
                width: widths/2.5,
                decoration: BoxDecoration(color: CupertinoColors.activeGreen,borderRadius: BorderRadius.circular(39)),
                child: Center(
                    child: Text("Join room", style: TextStyle(fontSize: heights * 0.018, color: Colors.white))
                )
            ),
          ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(width: widths/3.5,height: 0.5,color: Colors.grey,),
            const Text("or", style: TextStyle(color: Colors.grey),),
            Container(width: widths/3.5,height: 0.5,color: Colors.grey,)
          ],
        ),
      ],
    );
  }

  Widget generateRoomAndStartGame(){
    final cJVMCon = Provider.of<CreateJoinViewModel>(context,);
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    if(cJVMCon.generatedRoomCode.isEmpty){
      return InkWell(
        onTap: (){
          cJVMCon.generateRoomCode(context);

          Provider.of<LudoProvider>(
              context,
              listen: false).createRoom(context,);
        },
        child: Container(
            height: 35,
            width: widths/2.5,
            decoration: BoxDecoration(color: CupertinoColors.activeOrange,borderRadius: BorderRadius.circular(39)),
            child: Center(
                child: Text("Create Room", style: TextStyle(fontSize: heights * 0.018, color: Colors.white))
            )
        ),
      );
    }
    return Column(
      children: [
        InkWell(
          onTap: (){
            cJVMCon.startGame(context);
          },
          child: Container(
              height: 35,
              width: widths/2.5,
              decoration: BoxDecoration(color: CupertinoColors.activeOrange,borderRadius: BorderRadius.circular(39)),
              child: Center(
                  child: Text("Start game", style: TextStyle(fontSize: heights * 0.018, color: Colors.white))
              )
          ),
        ),
        shareRoomCode()
      ],
    );
  }

// Future<void> share() async {
//   final cJVMCon = Provider.of<CreateJoinViewModel>(context);
//   await FlutterShare.share(
//       title: 'Play with friends',
//       text: 'Create room and play ludo with your friends.' ,
//       linkUrl: cJVMCon.generatedRoomCode,
//       chooserTitle: 'Room Code: ${cJVMCon.generatedRoomCode}'
//   );
// }
}