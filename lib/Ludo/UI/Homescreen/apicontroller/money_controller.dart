class coinshop{
  String? id;
  String? coins;
  String? rupees;

coinshop({
    required this.id,
    required this.coins,
    required this.rupees,

});
 factory coinshop.fromJson(Map<String, dynamic>json) => coinshop(
     id: json["id"],
     coins: json["coins"],
     rupees: json["rupees"]
 );

}
