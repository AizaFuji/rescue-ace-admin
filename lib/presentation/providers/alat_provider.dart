import 'package:flutter/material.dart';
import '../../domain/entities/alat.dart';
import '../../domain/usecases/get_alat_locations_usecase.dart';
import '../../domain/usecases/add_alat_usecase.dart';

class AlatProvider with ChangeNotifier {
  final GetAlatLocationsUseCase getAlatLocationsUseCase;
  final AddAlatUseCase addAlatUseCase;

  AlatProvider(this.getAlatLocationsUseCase, this.addAlatUseCase);

  List<Alat> _alatLocations = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Alat> get alatLocations => _alatLocations;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAlatLocations() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _alatLocations = await getAlatLocationsUseCase.execute();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addAlat(Alat alat) async {
    try {
      await addAlatUseCase.execute(alat);
      await fetchAlatLocations(); // Refresh the list
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
