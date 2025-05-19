import 'package:flutter/material.dart';
import 'package:ludo_score/model/profile_model.dart';
import 'package:ludo_score/repo/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier{

 final ProfileRepo _profileRepo =ProfileRepo();

 ProfileModel? _profileModelData;
 ProfileModel? get  profileModelData => _profileModelData;
 void setProfileModelData(ProfileModel v){
   _profileModelData =v;
   notifyListeners();

 }

 Future<void> profileApi()async{
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    _profileRepo.profileApi(userid).then((value){
      if(value.error=="200"){
        setProfileModelData(value);
        debugPrint("profile data set successfully");
      }else{
        debugPrint("NO data found in profile api");
      }

    }).onError((error, stackTrace) {
      debugPrint("Error  $error");
    });


 }

}