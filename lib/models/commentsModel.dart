import 'dart:convert';

class commentModel {
  String profilePic;
  String username;
  String commentText;
  String commentId;
  String uid;
  int rating;
  commentModel({
    required this.profilePic,
    required this.username,
    required this.commentText,
    required this.commentId,
    required this.uid,
    required this.rating,
  });

  commentModel copyWith({
    String? profilePic,
    String? username,
    String? commentText,
    String? commentId,
    String? uid,
    int? rating,
  }) {
    return commentModel(
      profilePic: profilePic ?? this.profilePic,
      username: username ?? this.username,
      commentText: commentText ?? this.commentText,
      commentId: commentId ?? this.commentId,
      uid: uid ?? this.uid,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'profilePic': profilePic});
    result.addAll({'username': username});
    result.addAll({'commentText': commentText});
    result.addAll({'commentId': commentId});
    result.addAll({'uid': uid});
    result.addAll({'rating': rating});
  
    return result;
  }

  factory commentModel.fromMap(Map<String, dynamic> map) {
    return commentModel(
      profilePic: map['profilePic'] ?? '',
      username: map['username'] ?? '',
      commentText: map['commentText'] ?? '',
      commentId: map['commentId'] ?? '',
      uid: map['uid'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory commentModel.fromJson(String source) => commentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'commentModel(profilePic: $profilePic, username: $username, commentText: $commentText, commentId: $commentId, uid: $uid, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is commentModel &&
      other.profilePic == profilePic &&
      other.username == username &&
      other.commentText == commentText &&
      other.commentId == commentId &&
      other.uid == uid &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return profilePic.hashCode ^
      username.hashCode ^
      commentText.hashCode ^
      commentId.hashCode ^
      uid.hashCode ^
      rating.hashCode;
  }
}
