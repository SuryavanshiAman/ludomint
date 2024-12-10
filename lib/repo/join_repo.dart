
import 'package:flutter/foundation.dart';
import 'package:ludomint/Ludo/UI/constant/api%20constant.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class JoinRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> joinApi(dynamic data) async {
    try {
      print("QQQQ$data");
      dynamic response =
      await _apiServices.getPostApiResponse(AppConstants.joinMatch,data.toString() );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during joinApi: $e');
      }
      rethrow;
    }
  }

}