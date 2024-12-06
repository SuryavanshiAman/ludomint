class inviteaccepted{
  String? id;
  String? image;
  String? username;

  inviteaccepted({
    required this.id,
    required this.image,
    required this.username,

  });
  factory inviteaccepted.fromJson(Map<String, dynamic>json) => inviteaccepted(
      id: json["id"],
      image: json["image"],
      username: json["username"]
  );

}
