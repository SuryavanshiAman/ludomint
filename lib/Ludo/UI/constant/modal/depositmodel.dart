class Depositmodel{
  String? amount;
  String? datetime;
  String? type;
  String? status;

  Depositmodel({
    required this.amount,
    required this.datetime,
    required this.type,
    required this.status,


  });
  factory Depositmodel.fromJson(Map<String, dynamic>json) => Depositmodel(
      amount: json["amount"],
      datetime: json["datetime"],
      type: json["type"],
      status: json["payment_status"],

  );

}
