import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/user_model.dart';
import '../models/alat_model.dart';

class ApiDataSource {
  final String baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://rescue-ace.ddns.net';

  Future<UserModel> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/admin/loginAdmin');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login failed: ${response.reasonPhrase}');
    }
  }

  Future<List<AlatModel>> getAlatLocations() async {
    final url = Uri.parse('$baseUrl/Alat');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => AlatModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get alat locations: ${response.reasonPhrase}');
    }
  }

  Future<void> addAlat(AlatModel alat) async {
    final url = Uri.parse('$baseUrl/Alat');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(alat.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to add alat: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
