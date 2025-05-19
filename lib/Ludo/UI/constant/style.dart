
import 'package:ludo_score/Ludo/UI/constant/api%20constant.dart';
import 'package:flutter/material.dart';

import 'dimension.dart';

media(context){
  final height= MediaQuery.of(context).size.height;
}



final robotoRegular = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoMedium = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBlack = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);

final acmeRegular = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final acmeMedium = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final acmeBold = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final acmeBlack = TextStyle(
  fontFamily: AppConstants.fontAcme,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);

final RighteousRegular = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final RighteousMedium = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,

);

final RighteousBold = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final RighteousBlack = TextStyle(
  fontFamily: AppConstants.fontRighteous,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);


// final BoxDecoration riderContainerDecoration = BoxDecoration(
//   borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
//   color: Theme.of(Get.context!).primaryColor.withOpacity(0.1), shape: BoxShape.rectangle,
// );