class Alat {
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

  Alat({
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
}
