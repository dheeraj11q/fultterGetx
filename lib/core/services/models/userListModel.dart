// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

List<UserListModel> userListModelFromJson(String str) =>
    List<UserListModel>.from(
        json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  UserListModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
