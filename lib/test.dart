import 'package:flutter/material.dart';
import 'package:motion/motion.dart';
import 'package:flutter/material.dart' hide Card;

const cardBorderRadius = BorderRadius.all(Radius.circular(25));


class MotionDemoApp extends StatelessWidget {
  const MotionDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'Motion Demo',
    debugShowCheckedModeBanner: false,
    home: MotionDemoPage(),
  );
}

class MotionDemoPage extends StatefulWidget {
  const MotionDemoPage({Key? key}) : super(key: key);

  @override
  State<MotionDemoPage> createState() => _MotionDemoPageState();
}

class _MotionDemoPageState extends State<MotionDemoPage> {
  @override
  Widget build(BuildContext context) {
    if (Motion.instance.isPermissionRequired &&
        !Motion.instance.isPermissionGranted) {
      showPermissionRequestDialog(
        context,
        onDone: () {
          setState(() {});
        },
      );
    }

    return Scaffold(
        body: Stack(children: [
          Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Motion example',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    )),
                 Card(
                   shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
                   child: Container(
                     width: 280,
                     height: 170,
                   ),
                 ),
                Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Text(
                      'without Motion',
                      // style: Theme.of(context).textTheme.bodyText1,
                    )),
                Motion.elevated(
                  elevation: 70,
                  borderRadius: BorderRadius.circular(25),


                  child:  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      width: 280,
                      height: 170,
                      decoration: BoxDecoration(color: Colors.red,
                          border: Border.all(color: Colors.yellow,width: 2),borderRadius: BorderRadius.circular(10)),
                    ),

                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'with Motion',
                      // style: Theme.of(context).textTheme.bodyText1,
                    )),
              ]))
        ]));
  }

  Future<void> showPermissionRequestDialog(BuildContext context,
      {required Function() onDone}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission required'),
          content: const Text(
              'On iOS 13+, you need to grant access to the gyroscope. A permission will be requested to proceed.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Motion.instance.requestPermission();
              },
              child: const Text('OK'),
            ),
          ],
        ));
  }
}