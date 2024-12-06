// import 'package:flutter/material.dart';
// import 'package:ludomint/Ludo/UI/constant/slidingSwitch.dart';
//
// class sliding extends StatefulWidget {
//   const sliding({super.key});
//
//   @override
//   State<sliding> createState() => _slidingState();
// }
//
// class _slidingState extends State<sliding> {
//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       child: SlidingSwitch(
//         value: false,
//         width: 250,
//         onChanged: (bool value) {
//           print(value);
//         },
//         height: 55,
//         animationDuration: const Duration(milliseconds: 400),
//         onTap: () {},
//         onDoubleTap: () {},
//         onSwipe: () {},
//         textOff: "Female",
//         textOn: "Male",
//         colorOn: const Color(0xffdc6c73),
//         colorOff: const Color(0xff6682c0),
//         background: const Color(0xffe4e5eb),
//         buttonColor: const Color(0xfff7f5f7),
//         inactiveColor: const Color(0xff636f7b),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class JellyButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final double? width;
  final double? height;
  final IconData? iconData;
  final Color color;
  final bool? loading;
  const JellyButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.width,
    this.height,
    this.iconData,
    this.color = Colors.green,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 40,
          width: width ?? widths * 0.21,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 8,
                color: color,
                inset: true,
              ),
              BoxShadow(
                offset: Offset(0, -30),
                blurRadius: 20,
                color: color,
                inset: true,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconData == null
                  ? Container()
                  : Icon(
                iconData,
                size: 20,
                color: Colors.white,
              ),
              iconData == null
                  ? Container()
                  : SizedBox(
                width: widths / 50,
              ),
              loading == true
                  ? CircularProgressIndicator(
                color: Colors.white,
              )
                  : Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
