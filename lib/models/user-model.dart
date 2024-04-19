class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String bio;
  final String gender;
  final String addresss;
  final String numberPhone;
  final String provider;
  final String birthday; // Ngày tháng năm sinh
  final String createdAt; // Thời điểm tạo
  final String updatedAt; // Thời điểm cập nhật

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.bio,
    required this.birthday,
    required this.gender,
    required this.addresss,
    required this.numberPhone,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      bio: json['bio'],
      gender: json['gender'],
      addresss: json['address'],
      numberPhone: json['numberPhone'],
      provider: json['provider'],
      birthday: json['birthday'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'bio': bio,
      'gender': gender,
      'addresss': addresss,
      'numberPhone': numberPhone,
      'provider': provider,
      'birthday': birthday,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
