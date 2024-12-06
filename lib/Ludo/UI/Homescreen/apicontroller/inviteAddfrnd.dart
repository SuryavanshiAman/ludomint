class invitefrnd{
  String? id;
  String? image;
  String? username;

  invitefrnd({
    required this.id,
    required this.image,
    required this.username,

  });
  factory invitefrnd.fromJson(Map<String, dynamic>json) => invitefrnd(
      id: json["id"],
      image: json["image"],
      username: json["username"]
  );

}
