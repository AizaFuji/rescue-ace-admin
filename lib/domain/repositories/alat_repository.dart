import '../entities/alat.dart';

abstract class AlatRepository {
  Future<List<Alat>> getAlatLocations();
  Future<void> addAlat(Alat alat);
}
