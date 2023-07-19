import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:travenor/models/commentsModel.dart';

class HotelModel {
  String uid;
  String hotelName;
  int hotelPrice;
  String hotelImageUrl;
  String hotelCountry;
  String hotelCity;
  List<commentModel> comments;
  String hotelDetail;
  HotelModel({
    required this.uid,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotelImageUrl,
    required this.hotelCountry,
    required this.hotelCity,
    required this.comments,
    required this.hotelDetail,
  });
  

  HotelModel copyWith({
    String? uid,
    String? hotelName,
    int? hotelPrice,
    String? hotelImageUrl,
    String? hotelCountry,
    String? hotelCity,
    List<commentModel>? comments,
    String? hotelDetail,
  }) {
    return HotelModel(
      uid: uid ?? this.uid,
      hotelName: hotelName ?? this.hotelName,
      hotelPrice: hotelPrice ?? this.hotelPrice,
      hotelImageUrl: hotelImageUrl ?? this.hotelImageUrl,
      hotelCountry: hotelCountry ?? this.hotelCountry,
      hotelCity: hotelCity ?? this.hotelCity,
      comments: comments ?? this.comments,
      hotelDetail: hotelDetail ?? this.hotelDetail,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uid': uid});
    result.addAll({'hotelName': hotelName});
    result.addAll({'hotelPrice': hotelPrice});
    result.addAll({'hotelImageUrl': hotelImageUrl});
    result.addAll({'hotelCountry': hotelCountry});
    result.addAll({'hotelCity': hotelCity});
    result.addAll({'comments': comments.map((x) => x.toMap()).toList()});
    result.addAll({'hotelDetail': hotelDetail});
  
    return result;
  }

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    return HotelModel(
      uid: map['uid'] ?? '',
      hotelName: map['hotelName'] ?? '',
      hotelPrice: map['hotelPrice']?.toInt() ?? 0,
      hotelImageUrl: map['hotelImageUrl'] ?? '',
      hotelCountry: map['hotelCountry'] ?? '',
      hotelCity: map['hotelCity'] ?? '',
      comments: List<commentModel>.from(map['comments']?.map((x) => commentModel.fromMap(x))),
      hotelDetail: map['hotelDetail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelModel.fromJson(String source) => HotelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HotelModel(uid: $uid, hotelName: $hotelName, hotelPrice: $hotelPrice, hotelImageUrl: $hotelImageUrl, hotelCountry: $hotelCountry, hotelCity: $hotelCity, comments: $comments, hotelDetail: $hotelDetail)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HotelModel &&
      other.uid == uid &&
      other.hotelName == hotelName &&
      other.hotelPrice == hotelPrice &&
      other.hotelImageUrl == hotelImageUrl &&
      other.hotelCountry == hotelCountry &&
      other.hotelCity == hotelCity &&
      listEquals(other.comments, comments) &&
      other.hotelDetail == hotelDetail;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      hotelName.hashCode ^
      hotelPrice.hashCode ^
      hotelImageUrl.hashCode ^
      hotelCountry.hashCode ^
      hotelCity.hashCode ^
      comments.hashCode ^
      hotelDetail.hashCode;
  }
}
