class User {
  final String uid;
  final String email;
  final String? displayName;
  final String? avatar;
  final String role;
  final bool isVip;
  final String? vipExpiryDate;

  User({
    required this.uid,
    required this.email,
    this.displayName,
    this.avatar,
    required this.role,
    required this.isVip,
    this.vipExpiryDate,
  });

  //formJson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String? ?? '',
      email: json['email'] as String? ?? '',
      displayName: json['displayName'] as String?,
      avatar: json['avatar'] as String?,
      role: json['role'] as String? ?? 'user',
      isVip: json['isVip'] as bool? ?? false,
      vipExpiryDate: json['vipExpiryDate'] as String?,
    );
  }
}
