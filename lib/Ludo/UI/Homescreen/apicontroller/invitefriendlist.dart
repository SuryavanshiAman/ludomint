class invitefrndlistlist{
  String? id;
  String? image;
  String? username;
  String? ref_id;
  String? bonus;

  invitefrndlistlist({
    required this.id,
    required this.image,
    required this.username,
    required this.ref_id,
    required this.bonus,

  });
  factory invitefrndlistlist.fromJson(Map<String, dynamic>json) => invitefrndlistlist(
      id: json["id"],
      image: json["image"],
      username: json["username"],
      ref_id: json["ref_id"],
      bonus: json["bonus"]
  );

}
