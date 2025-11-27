class UserModel {
  final int idAdmin;
  final String nama;
  final String email;
  final String telp;

  UserModel({
    required this.idAdmin,
    required this.nama,
    required this.email,
    required this.telp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idAdmin: json['id_admin'],
      nama: json['nama'],
      email: json['email'],
      telp: json['telp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_admin': idAdmin,
      'nama': nama,
      'email': email,
      'telp': telp,
    };
  }
}
