// ignore_for_file: constant_identifier_names

class AppConstants {
  static const int timeOut = 30;
  static const String fontFamily = 'Roboto';
  static const String fontAcme = 'Acme';
  static const String fontRighteous = 'Righteous';
  static const String MainBaseurl = 'https://root.ludomint.in/';
  static const String Baseurl = '${MainBaseurl}index.php/api/Mobile_app/';
  static const String imageurl = '${MainBaseurl}uploads/';
  static const String login = '${Baseurl}login_number';
  static const String Send_otp = 'https://otp.fctechteam.org/send_otp.php?';
  static const String OTP_verify = "https://otp.fctechteam.org/verifyotp.php?";
  static const String register = '${Baseurl}user_register';
  static const String profile = '${Baseurl}profile?userid=';
  static const String changepassord = '${Baseurl}change_password';
  static const String bankDetails = '${Baseurl}Bank_detail';
  static const String paytmDetails = '${Baseurl}paytm_detail';
  static const String links = '${Baseurl}link';
  static const String rules = '${Baseurl}ruless';
  static const String profileupdate = '${Baseurl}profile_update';
  static const String shopcoin = '${Baseurl}coins_list';
  static const String inviteadd = '${Baseurl}addfriend?userid=';
  static const String addfrnd = '${Baseurl}addfriendlist';
  static const String acceptedfrnd = '${Baseurl}acceptedlist?userid=';
  static const String acceptinvite = '${Baseurl}acceptrequest';
  static const String rejectinvite = '${Baseurl}rejectrequest';
  static const String allfrnd = '${Baseurl}userfriendlist?userid=';

  static const String ResendOtp = '${Baseurl}resend_otp';
  static const String UPI = '${Baseurl}upiadd';
  static const String referhistory = '${Baseurl}refral_list?userid=';
  static const String deposithistory = '${Baseurl}transhistory_deposit?userid=';
  static const String withdrawlhistory =
      '${Baseurl}transhistory_withdrawl?userid=';
  static const String withdrawDropdown =
      '${Baseurl}withdrawal_banklist?userid=';
  static const String withdrawalMoney = '${Baseurl}withdrawl';
  static const String Addmoney = '${Baseurl}payin';
  static const String createMatch = '${Baseurl}join_match';
  static const String joinMatch = '${Baseurl}join_roomcode';
  static const String winningMatch = '${Baseurl}winning_match';
  static const String privacy = '${Baseurl}get_privacy_policy';
}
