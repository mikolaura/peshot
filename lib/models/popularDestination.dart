// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PopularDestination {
  String nameOfCountry;
  String image;
  PopularDestination({
    required this.nameOfCountry,
    required this.image,
  });

  PopularDestination copyWith({
    String? nameOfCountry,
    String? image,
  }) {
    return PopularDestination(
      nameOfCountry: nameOfCountry ?? this.nameOfCountry,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameOfCountry': nameOfCountry,
      'image': image,
    };
  }

  factory PopularDestination.fromMap(Map<String, dynamic> map) {
    return PopularDestination(
      nameOfCountry: map['nameOfCountry'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularDestination.fromJson(String source) => PopularDestination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PopularDestination(nameOfCountry: $nameOfCountry, image: $image)';

  @override
  bool operator ==(covariant PopularDestination other) {
    if (identical(this, other)) return true;
  
    return 
      other.nameOfCountry == nameOfCountry &&
      other.image == image;
  }

  @override
  int get hashCode => nameOfCountry.hashCode ^ image.hashCode;
}
final List<PopularDestination> popularDestination = [
  PopularDestination(nameOfCountry: 'Japan', image: 'assets/japan.png'),
  PopularDestination(nameOfCountry: 'France', image: 'assets/france.png'),
  PopularDestination(nameOfCountry: 'England', image: 'assets/london.png'),
];