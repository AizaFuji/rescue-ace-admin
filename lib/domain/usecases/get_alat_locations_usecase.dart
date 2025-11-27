import '../entities/alat.dart';
import '../repositories/alat_repository.dart';

class GetAlatLocationsUseCase {
  final AlatRepository alatRepository;

  GetAlatLocationsUseCase(this.alatRepository);

  Future<List<Alat>> execute() {
    return alatRepository.getAlatLocations();
  }
}
