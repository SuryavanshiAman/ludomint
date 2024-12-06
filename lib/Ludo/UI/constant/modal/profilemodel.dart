class UserProfile {
  final String id;
  final String refId;
  final String name;
  final String username;
  final String phone;
  final String age;
  final String referralCode;
  final String codes;
  final String bonus;
  final String accountNumber;
  final String ifscCode;
  final String accountHolderName;
  final String bankName;
  final String upiId;
  final String paytmNumber;
  final String paytmHolderName;
  final String status;
  final String date;
  final String wallet;
  final String winning;
  final String image;
  final String randId;
  final String type;
  final String userStatus;
  final String addFriend;
  final String joinId;

  UserProfile({
    required this.id,
    required this.refId,
    required this.name,
    required this.username,
    required this.phone,
    required this.age,
    required this.referralCode,
    required this.codes,
    required this.bonus,
    required this.accountNumber,
    required this.ifscCode,
    required this.accountHolderName,
    required this.bankName,
    required this.upiId,
    required this.paytmNumber,
    required this.paytmHolderName,
    required this.status,
    required this.date,
    required this.wallet,
    required this.winning,
    required this.image,
    required this.randId,
    required this.type,
    required this.userStatus,
    required this.addFriend,
    required this.joinId,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      refId: json['ref_id'] ?? '',
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      age: json['age'] ?? '',
      referralCode: json['refral_code'] ?? '',
      codes: json['codes'] ?? '',
      bonus: json['bonus'] ?? '',
      accountNumber: json['accontno'] ?? '',
      ifscCode: json['ifsc_code'] ?? '',
      accountHolderName: json['acholder_name'] ?? '',
      bankName: json['bankname'] ?? '',
      upiId: json['upi_id'] ?? '',
      paytmNumber: json['paytm_no'] ?? '',
      paytmHolderName: json['ptm_holder_name'] ?? '',
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      wallet: json['wallet'] ?? '',
      winning: json['winning'] ?? '',
      image: json['image'] ?? '',
      randId: json['rand_id'] ?? '',
      type: json['type'] ?? '',
      userStatus: json['userstatus'] ?? '',
      addFriend: json['add_friend'] ?? '',
      joinId: json['join_id'] ?? '',
    );
  }
}