import '../entities/alat.dart';
import '../repositories/alat_repository.dart';

class AddAlatUseCase {
  final AlatRepository alatRepository;

  AddAlatUseCase(this.alatRepository);

  Future<void> execute(Alat alat) {
    return alatRepository.addAlat(alat);
  }
}
