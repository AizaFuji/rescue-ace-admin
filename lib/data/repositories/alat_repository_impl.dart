import '../../domain/entities/alat.dart';
import '../../domain/repositories/alat_repository.dart';
import '../datasources/api_datasource.dart';
import '../models/alat_model.dart';

class AlatRepositoryImpl implements AlatRepository {
  final ApiDataSource apiDataSource;

  AlatRepositoryImpl(this.apiDataSource);

  @override
  Future<List<Alat>> getAlatLocations() async {
    final alatModels = await apiDataSource.getAlatLocations();
    return alatModels.map((model) => Alat(
      idAlat: model.idAlat,
      namaPic1: model.namaPic1,
      telpPic1: model.telpPic1,
      namaPic2: model.namaPic2,
      telpPic2: model.telpPic2,
      alamat: model.alamat,
      telp: model.telp,
      linkMaps: model.linkMaps,
      longitude: model.longitude,
      latitude: model.latitude,
    )).toList();
  }

  @override
  Future<void> addAlat(Alat alat) async {
    final alatModel = AlatModel(
      idAlat: alat.idAlat,
      namaPic1: alat.namaPic1,
      telpPic1: alat.telpPic1,
      namaPic2: alat.namaPic2,
      telpPic2: alat.telpPic2,
      alamat: alat.alamat,
      telp: alat.telp,
      linkMaps: alat.linkMaps,
      longitude: alat.longitude,
      latitude: alat.latitude,
    );
    return apiDataSource.addAlat(alatModel);
  }
}
