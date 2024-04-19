class UserModel {
  String? id;
  String? name;
  String? email;
  String? avatarUrl;
  String? bio;
  String? gender;
  String? address;
  String? numberPhone;
  String? provider;
  String? birthday; // Ngày tháng năm sinh
  String? createdAt; // Thời điểm tạo
  String? updatedAt; // Thời điểm cập nhật

  UserModel({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
    this.bio,
    this.birthday,
    this.gender,
    this.address,
    this.numberPhone,
    this.provider,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      bio: json['bio'],
      gender: json['gender'],
      address: json['address'],
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
      'address': address,
      'numberPhone': numberPhone,
      'provider': provider,
      'birthday': birthday,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
