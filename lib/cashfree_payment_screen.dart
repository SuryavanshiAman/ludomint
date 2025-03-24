// import 'package:flutter/material.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/res/custom_rich_text.dart';
// import 'package:health_crad_user/view_model/payment_view_model.dart';
// import 'package:health_crad_user/view_model/service/payment_service.dart';
// import 'package:provider/provider.dart';
//
// import '../generated/assets.dart';
// import '../main.dart';
// import '../res/app_constant.dart';
// import '../res/text_const.dart';
// import '../view_model/cart_view_model.dart';
// import '../view_model/coupon_view_model.dart';
// import '../view_model/doctor_view_model.dart';
//
// class PaymentGatewayPayOptions extends StatefulWidget {
//   const PaymentGatewayPayOptions({super.key});
//
//   @override
//   State<PaymentGatewayPayOptions> createState() =>
//       _PaymentGatewayPayOptionsState();
// }
//
// class _PaymentGatewayPayOptionsState extends State<PaymentGatewayPayOptions> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Map arguments =
//       ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//       print("data: ${arguments["amountPayable"]}, ${arguments["paymentFor"]}");
//       Provider.of<PaymentViewModel>(context, listen: false).makePaymentRequest(
//           arguments["amountPayable"], arguments["paymentFor"], context);
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Map arguments =
//     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     final paymentCon = Provider.of<PaymentService>(context);
//     return Scaffold(
//       appBar: appBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             arguments["paymentFor"] == "1"
//                 ? pricingDetailsDoctor(context)
//                 : pricingDetailsMedicine(context),
//             AppConstant.spaceHeight10,
//             paymentOptionTile(Assets.assetsUpiIcon, "Pay Via UPI", () {
//               paymentCon.payUsingUpi();
//             }, children: [const SizedBox.shrink()]),
//             // paymentOptionTile(Assets.assetsCardIcon, "Pay Via Card", () {},
//             //     children: [
//             //       if (paymentCon.cfCardWidget != null)
//             //         Padding(
//             //           padding: const EdgeInsets.symmetric(vertical: 10),
//             //           child: paymentCon.cfCardWidget!,
//             //         ),
//             //       ButtonConst(
//             //         onTap: () {
//             //           paymentCon.payUsingCard();
//             //         },
//             //         label: "Proceed",
//             //         margin: const EdgeInsets.symmetric(
//             //             horizontal: 20, vertical: 10),
//             //         textColor: AppColor.whiteColor,
//             //       ),
//             //     ]),
//             paymentOptionTile(Assets.assetsUpiappIcon, "Pay Via App", () {
//               paymentCon.payUsingUpiApp();
//             }, children: [const SizedBox.shrink()]),
//           ],
//         ),
//       ),
//     );
//   }
//
//   PreferredSizeWidget appBar() {
//     return AppBar(
//       backgroundColor: AppColor.primaryColor,
//       automaticallyImplyLeading: false,
//       title: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: Image.asset(
//                 Assets.iconsArrowBack,
//                 color: AppColor.whiteColor,
//                 scale: 3,
//               ),
//             ),
//             AppConstant.spaceWidth15,
//             TextConst(
//               title: 'Payment',
//               fontSize: AppConstant.fontSizeThree,
//               color: AppColor.whiteColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         Container(
//           margin: const EdgeInsets.only(right: 15),
//           padding: const EdgeInsets.symmetric(
//             horizontal: 5,
//             vertical: 6,
//           ),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: AppColor.whiteColor,
//               border: Border.all(color: AppColor.textColor)),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.lock,
//                 color: AppColor.textColor,
//                 size: 20,
//               ),
//               AppConstant.spaceWidth5,
//               TextConst(
//                 title: "100% Secured",
//                 color: AppColor.textColor,
//                 fontSize: AppConstant.fontSizeOne,
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget pricingDetailsMedicine(context) {
//     final cartViewModel = Provider.of<CartViewModel>(context);
//     return Container(
//       color: AppColor.whiteColor,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppConstant.spaceHeight10,
//           TextConst(
//             title: 'Price Details',
//             fontSize: AppConstant.fontSizeTwo,
//             color: AppColor.blackColor,
//             fontWeight: FontWeight.w600,
//           ),
//           AppConstant.spaceHeight10,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextConst(
//                 title: 'Item Cost',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w400,
//               ),
//               TextConst(
//                 title: '₹ ${cartViewModel.vModelData!.itemCost.toString()}',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.blackColor,
//                 fontWeight: FontWeight.w400,
//               ),
//             ],
//           ),
//           AppConstant.spaceHeight5,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextConst(
//                 title: 'Discount',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w400,
//               ),
//               TextConst(
//                 title:
//                 '-₹ ${cartViewModel.vModelData!.totalDiscount.toString()}',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.greenColor,
//                 fontWeight: FontWeight.w400,
//               ),
//             ],
//           ),
//           AppConstant.spaceHeight5,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextConst(
//                 title: 'Green Packaging',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w400,
//               ),
//               CustomRichText(textSpans: [
//                 CustomTextSpan(
//                   text: "₹ ${cartViewModel.greenPackagingCharge.toString()} ",
//                   decoration: TextDecoration.lineThrough,
//                   fontWeight: FontWeight.w400,
//                   textColor: AppColor.textColor,
//                   fontSize: AppConstant.fontSizeTwo,
//                 ),
//                 CustomTextSpan(
//                   text:
//                   " ₹ ${cartViewModel.vModelData!.packagingCharge.toString()}",
//                   fontWeight: FontWeight.w400,
//                   textColor: AppColor.blackColor,
//                   fontSize: AppConstant.fontSizeTwo,
//                 ),
//               ]),
//             ],
//           ),
//           AppConstant.spaceHeight5,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextConst(
//                 title: 'Delivery Charge',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w400,
//               ),
//               CustomRichText(textSpans: [
//                 CustomTextSpan(
//                   text: "₹ ${cartViewModel.deliveryCharge.toString()} ",
//                   decoration: TextDecoration.lineThrough,
//                   fontWeight: FontWeight.w400,
//                   textColor: AppColor.textColor,
//                   fontSize: AppConstant.fontSizeTwo,
//                 ),
//                 CustomTextSpan(
//                   text:
//                   " ₹ ${((cartViewModel.vModelData!.deliveryCharge)).toString()}",
//                   fontWeight: FontWeight.w400,
//                   textColor: AppColor.blackColor,
//                   fontSize: AppConstant.fontSizeTwo,
//                 ),
//               ]),
//             ],
//           ),
//           isCouponApplied(),
//           AppConstant.spaceHeight5,
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 3),
//             child: Divider(),
//           ),
//           AppConstant.spaceHeight5,
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             decoration: BoxDecoration(
//                 color: AppColor.searchFieldBgColor,
//                 borderRadius: BorderRadius.circular(5)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextConst(
//                   title: 'Total Cost',
//                   fontSize: AppConstant.fontSizeTwo,
//                   color: AppColor.buttonBlueColor,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 TextConst(
//                   title:
//                   '₹ ${((cartViewModel.vModelData!.totalAmount)).toString()}',
//                   fontSize: AppConstant.fontSizeTwo,
//                   color: AppColor.buttonBlueColor,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ],
//             ),
//           ),
//           AppConstant.spaceHeight10,
//           Consumer<CouponViewModel>(builder: (context, couponCon, _) {
//             return CustomRichText(textSpans: [
//               CustomTextSpan(
//                 text: "You will save",
//                 textColor: AppColor.greenColor,
//                 fontSize: AppConstant.fontSizeTwo,
//               ),
//               CustomTextSpan(
//                 text:
//                 " ₹ ${cartViewModel.vModelData!.descountCupon != "0" && couponCon.appliedCoupon != null ? double.parse(cartViewModel.totalSaving.toString()) + double.parse(couponCon.appliedCoupon!.discountPrice.toString()) : cartViewModel.totalSaving}",
//                 fontWeight: FontWeight.bold,
//                 textColor: AppColor.greenColor,
//                 fontSize: AppConstant.fontSizeThree,
//               ),
//               CustomTextSpan(
//                 text: " on this order",
//                 textColor: AppColor.greenColor,
//                 fontSize: AppConstant.fontSizeTwo,
//               ),
//             ]);
//           }),
//         ],
//       ),
//     );
//   }
//
//   Widget pricingDetailsDoctor(context) {
//     final doctorViewModel = Provider.of<DoctorViewModel>(context);
//     return Container(
//       width: screenWidth,
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//       color: AppColor.whiteColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextConst(
//             title: 'Payment details',
//             fontSize: AppConstant.fontSizeTwo,
//             color: AppColor.blackColor,
//             fontWeight: FontWeight.bold,
//           ),
//           AppConstant.spaceHeight10,
//           SizedBox(
//             width: screenWidth,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextConst(
//                       title: 'Consultation Fee',
//                       fontSize: AppConstant.fontSizeOne,
//                       color: AppColor.textColor,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     AppConstant.spaceHeight5,
//                     TextConst(
//                       title: 'Service fee & tax',
//                       fontSize: AppConstant.fontSizeOne,
//                       color: AppColor.textColor,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextConst(
//                       title:
//                       '₹ ${doctorViewModel.getDoctorModelData!.getDoctorModelData![doctorViewModel.selectedIndex].fees}',
//                       fontSize: AppConstant.fontSizeTwo,
//                       color: AppColor.textColor,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     CustomRichText(textSpans: [
//                       CustomTextSpan(
//                           text: "₹45",
//                           decoration: TextDecoration.lineThrough,
//                           fontWeight: FontWeight.w400,
//                           textColor: AppColor.textColor,
//                           fontSize: AppConstant.fontSizeTwo),
//                       CustomTextSpan(
//                           text: "  Free",
//                           fontWeight: FontWeight.w400,
//                           textColor: AppColor.greenColor,
//                           fontSize: AppConstant.fontSizeTwo)
//                     ]),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           AppConstant.spaceHeight10,
//           SizedBox(
//             width: screenWidth,
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(
//                 int.parse((screenWidth / 8).toStringAsFixed(0)),
//                     (i) => TextConst(
//                   title: '-',
//                   fontSize: AppConstant.fontSizeZero,
//                   color: AppColor.textColor.withOpacity(0.7),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           AppConstant.spaceHeight10,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextConst(
//                   title: 'Total Payable',
//                   fontSize: AppConstant.fontSizeTwo,
//                   color: AppColor.blackColor,
//                 ),
//                 TextConst(
//                   title:
//                   '₹ ${doctorViewModel.getDoctorModelData!.getDoctorModelData![doctorViewModel.selectedIndex].fees}',
//                   fontSize: AppConstant.fontSizeTwo,
//                   color: AppColor.blackColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ],
//             ),
//           ),
//           AppConstant.spaceHeight15,
//           Container(
//             width: screenWidth,
//             height: screenHeight * 0.04,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(Assets.imageGreenDotBg),
//                     fit: BoxFit.fill)),
//             child: TextConst(
//               title: 'You will save ₹ 45 on this appointment',
//               fontSize: AppConstant.fontSizeOne,
//               color: AppColor.greenColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget isCouponApplied() {
//     return Consumer<CouponViewModel>(builder: (context, couponCon, _) {
//       if (couponCon.appliedCoupon == null ||
//           couponCon.appliedCoupon.toString() == "0") {
//         return const SizedBox.shrink();
//       }
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               TextConst(
//                 title: 'Coupon Discount',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.greenColor,
//                 fontWeight: FontWeight.w400,
//               ),
//               Image.asset(
//                 Assets.iconsDiscountIcon,
//                 height: 25,
//                 width: 25,
//               ),
//             ],
//           ),
//           TextConst(
//             title: '₹ ${(couponCon.appliedCoupon!.discountPrice).toString()} ',
//             fontSize: AppConstant.fontSizeTwo,
//             color: AppColor.greenColor,
//             fontWeight: FontWeight.w400,
//           )
//         ],
//       );
//     });
//   }
//
//   Widget paymentOptionTile(String image, String title, void Function() onTap,
//       {List<Widget>? children}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Card(
//           color: Colors.white,
//           child: Theme(
//             data: ThemeData(dividerColor: Colors.transparent),
//             child: ExpansionTile(
//               onExpansionChanged: (v) {
//                 onTap();
//               },
//               // onTap: onTap,
//               leading: Container(
//                 width: 50,
//                 margin: const EdgeInsets.fromLTRB(0, 6, 5, 6),
//                 decoration: BoxDecoration(
//                     color: AppColor.whiteColor,
//                     boxShadow: [
//                       BoxShadow(
//                           color: AppColor.greyColor.withOpacity(0.4),
//                           offset: const Offset(0, 1),
//                           spreadRadius: 1,
//                           blurRadius: 2)
//                     ],
//                     image: DecorationImage(
//                       image: AssetImage(image),
//                     ),
//                     shape: BoxShape.circle),
//               ),
//               title: TextConst(
//                 title: title,
//                 textAlign: TextAlign.start,
//               ),
//               trailing: Icon(
//                 Icons.navigate_next,
//                 color: AppColor.textColor,
//               ),
//               children: children!,
//             ),
//           )),
//     );
//   }
// }