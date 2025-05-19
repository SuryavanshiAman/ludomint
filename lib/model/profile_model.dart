class ProfileModel {
  Data? data;
  String? msg;
  String? error;

  ProfileModel({this.data, this.msg, this.error});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    data['error'] = error;
    return data;
  }
}

class Data {
  dynamic id;
  dynamic refId;
  String? name;
  String? username;
  dynamic password;
  dynamic confirmPassword;
  String? phone;
  dynamic email;
  dynamic age;
  String? refralCode;
  String? codes;
  String? bonus;
  dynamic accontno;
  dynamic ifscCode;
  dynamic acholderName;
  dynamic bankname;
  dynamic upiId;
  dynamic paytmNo;
  dynamic ptmHolderName;
  String? status;
  String? date;
  String? wallet;
  dynamic winning;
  dynamic image;
  String? randId;
  dynamic type;
  String? userstatus;
  dynamic addFriend;
  dynamic joinId;

  Data(
      {this.id,
        this.refId,
        this.name,
        this.username,
        this.password,
        this.confirmPassword,
        this.phone,
        this.email,
        this.age,
        this.refralCode,
        this.codes,
        this.bonus,
        this.accontno,
        this.ifscCode,
        this.acholderName,
        this.bankname,
        this.upiId,
        this.paytmNo,
        this.ptmHolderName,
        this.status,
        this.date,
        this.wallet,
        this.winning,
        this.image,
        this.randId,
        this.type,
        this.userstatus,
        this.addFriend,
        this.joinId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refId = json['ref_id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    phone = json['phone'];
    email = json['email'];
    age = json['age'];
    refralCode = json['refral_code'];
    codes = json['codes'];
    bonus = json['bonus'];
    accontno = json['accontno'];
    ifscCode = json['ifsc_code'];
    acholderName = json['acholder_name'];
    bankname = json['bankname'];
    upiId = json['upi_id'];
    paytmNo = json['paytm_no'];
    ptmHolderName = json['ptm_holder_name'];
    status = json['status'];
    date = json['date'];
    wallet = json['wallet'];
    winning = json['winning'];
    image = json['image'];
    randId = json['rand_id'];
    type = json['type'];
    userstatus = json['userstatus'];
    addFriend = json['add_friend'];
    joinId = json['join_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ref_id'] = refId;
    data['name'] = name;
    data['username'] = username;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    data['phone'] = phone;
    data['email'] = email;
    data['age'] = age;
    data['refral_code'] = refralCode;
    data['codes'] = codes;
    data['bonus'] = bonus;
    data['accontno'] = accontno;
    data['ifsc_code'] = ifscCode;
    data['acholder_name'] = acholderName;
    data['bankname'] = bankname;
    data['upi_id'] = upiId;
    data['paytm_no'] = paytmNo;
    data['ptm_holder_name'] = ptmHolderName;
    data['status'] = status;
    data['date'] = date;
    data['wallet'] = wallet;
    data['winning'] = winning;
    data['image'] = image;
    data['rand_id'] = randId;
    data['type'] = type;
    data['userstatus'] = userstatus;
    data['add_friend'] = addFriend;
    data['join_id'] = joinId;
    return data;
  }
}
