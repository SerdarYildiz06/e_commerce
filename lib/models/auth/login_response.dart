import 'dart:convert';

class LoginResponse {
  LoginResponse(
      {required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token});

  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  LoginResponse copyWith({
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) {
    return LoginResponse(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'gender': gender});
    result.addAll({'image': image});
    result.addAll({'token': token});

    return result;
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
        username: map['username'] ?? '',
        email: map['email'] ?? '',
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        gender: map['gender'] ?? '',
        image: map['image'] ?? '',
        token: map['token'] ?? '');
  }
  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponse(username: $username, email: $email, firstName: $firstName,firstName: $firstName,lastName: $lastName,gender: $gender,image: $image,token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse &&
        other.username == username &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.gender == gender &&
        other.image == image &&
        other.token == token;
  }

  @override
  int get hashCode =>
      username.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      gender.hashCode ^
      image.hashCode ^
      token.hashCode;
}
