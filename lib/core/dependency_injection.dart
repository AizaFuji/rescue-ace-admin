import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/api_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/alat_repository_impl.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/get_alat_locations_usecase.dart';
import '../domain/usecases/add_alat_usecase.dart';
import '../presentation/providers/auth_provider.dart';
import '../presentation/providers/alat_provider.dart';

class DependencyInjection {
  static List<SingleChildWidget> getProviders() {
    final apiDataSource = ApiDataSource();
    final authRepository = AuthRepositoryImpl(apiDataSource);
    final alatRepository = AlatRepositoryImpl(apiDataSource);

    final loginUseCase = LoginUseCase(authRepository);
    final getAlatLocationsUseCase = GetAlatLocationsUseCase(alatRepository);
    final addAlatUseCase = AddAlatUseCase(alatRepository);

    return [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(loginUseCase),
      ),
      ChangeNotifierProvider(
        create: (_) => AlatProvider(getAlatLocationsUseCase, addAlatUseCase),
      ),
    ];
  }
}
