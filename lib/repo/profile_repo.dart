import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ludo_score/Ludo/UI/constant/api%20constant.dart';
import 'package:ludo_score/helper/network/base_api_services.dart';
import 'package:ludo_score/helper/network/network_api_services.dart';
import 'package:ludo_score/model/profile_model.dart';

class ProfileRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileModel> profileApi(dynamic userId) async {
     try{
        dynamic res =
        await _apiServices.getGetApiResponse(AppConstants.profile + userId);
        return ProfileModel.fromJson(res);
     }catch(e){
        debugPrint("Error during profileApi $e");
        rethrow;
     }

  }
}
