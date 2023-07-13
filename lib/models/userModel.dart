import 'dart:convert';

class UserModel {
  String uid;
  String email;
  String password;
  String firstName;
  String lastName;
  String profilePic;
  String addres;
  String phone;
  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
    required this.addres,
    required this.phone,
  });
  

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? profilePic,
    String? addres,
    String? phone,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
      addres: addres ?? this.addres,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uid': uid});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'profilePic': profilePic});
    result.addAll({'addres': addres});
    result.addAll({'phone': phone});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      profilePic: map['profilePic'] ?? '',
      addres: map['addres'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, password: $password, firstName: $firstName, lastName: $lastName, profilePic: $profilePic, addres: $addres, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.email == email &&
      other.password == password &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.profilePic == profilePic &&
      other.addres == addres &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      email.hashCode ^
      password.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      profilePic.hashCode ^
      addres.hashCode ^
      phone.hashCode;
  }
}
