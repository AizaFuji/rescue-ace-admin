class AlatModel {
  final int idAlat;
  final String namaPic1;
  final String telpPic1;
  final String? namaPic2;
  final String? telpPic2;
  final String alamat;
  final String telp;
  final String linkMaps;
  final double longitude;
  final double latitude;

  AlatModel({
    required this.idAlat,
    required this.namaPic1,
    required this.telpPic1,
    this.namaPic2,
    this.telpPic2,
    required this.alamat,
    required this.telp,
    required this.linkMaps,
    required this.longitude,
    required this.latitude,
  });

  factory AlatModel.fromJson(Map<String, dynamic> json) {
    return AlatModel(
      idAlat: json['id_alat'],
      namaPic1: json['nama_pic1'],
      telpPic1: json['telp_pic1'],
      namaPic2: json['nama_pic2'],
      telpPic2: json['telp_pic2'],
      alamat: json['alamat'],
      telp: json['telp'],
      linkMaps: json['link_maps'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_alat': idAlat,
      'nama_pic1': namaPic1,
      'telp_pic1': telpPic1,
      'nama_pic2': namaPic2,
      'telp_pic2': telpPic2,
      'alamat': alamat,
      'telp': telp,
      'link_maps': linkMaps,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
