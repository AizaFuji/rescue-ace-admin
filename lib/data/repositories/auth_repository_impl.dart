import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/api_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiDataSource apiDataSource;

  AuthRepositoryImpl(this.apiDataSource);

  @override
  Future<User> login(String email, String password) async {
    final userModel = await apiDataSource.login(email, password);
    return User(
      idAdmin: userModel.idAdmin,
      nama: userModel.nama,
      email: userModel.email,
      telp: userModel.telp,
    );
  }
}
