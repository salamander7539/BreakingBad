import 'dart:convert';

ActorsModel actorsModelFromJson(String str) => ActorsModel.fromJson(json.decode(str));

String actorsModelToJson(ActorsModel data) => json.encode(data.toJson());

class ActorsModel {
  ActorsModel({
    this.charId,
    this.name,
    this.birthday,
    this.img,
    this.status,
    this.nickname,
    this.portrayed,
  });

  final int? charId;
  final String? name;
  final String? birthday;
  final String? img;
  final String? status;
  final String? nickname;
  final String? portrayed;

  factory ActorsModel.fromJson(Map<String, dynamic> json) => ActorsModel(
    charId: json["char_id"],
    name: json["name"],
    birthday: json["birthday"],
    img: json["img"],
    status: json["status"],
    nickname: json["nickname"],
    portrayed: json["portrayed"],
  );

  Map<String, dynamic> toJson() => {
    "char_id": charId,
    "name": name,
    "birthday": birthday,
    "img": img,
    "status": status,
    "nickname": nickname,
    "portrayed": portrayed,
  };
}
