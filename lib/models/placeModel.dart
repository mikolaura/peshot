// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlaceModel {
  String placeName;
  String image;
  String bio;
  PlaceModel({
    required this.placeName,
    required this.image,
    required this.bio,
  });

  PlaceModel copyWith({
    String? placeName,
    String? image,
    String? bio,
  }) {
    return PlaceModel(
      placeName: placeName ?? this.placeName,
      image: image ?? this.image,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'placeName': placeName,
      'image': image,
      'bio': bio,
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      placeName: map['placeName'] as String,
      image: map['image'] as String,
      bio: map['bio'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) =>
      PlaceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PlaceModel(placeName: $placeName, image: $image, bio: $bio)';

  @override
  bool operator ==(covariant PlaceModel other) {
    if (identical(this, other)) return true;

    return other.placeName == placeName &&
        other.image == image &&
        other.bio == bio;
  }

  @override
  int get hashCode => placeName.hashCode ^ image.hashCode ^ bio.hashCode;
}

var places = [
  PlaceModel(
      placeName: 'London',
      image: 'assets/london.png',
      bio:
          'Big Ben is the name of a large bell in the center of the clock tower located north of the Palace of Westminster'),
PlaceModel(
      placeName: 'Paris',
      image: 'assets/france.png',
      bio:
        'The Eiffel Tower has 1,665 stairs and three viewing platforms. Nearly 50 miles of electric cables cover the structure'),

];
