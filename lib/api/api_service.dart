import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api"; // untuk emulator

  // =================================================
  // LOGIN (api/login)
  // =================================================
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    return jsonDecode(response.body);
  }

  // =================================================
  // GET USER (api/me)
  // =================================================
  static Future<Map<String, dynamic>?> getUser() async {
    final token = await TokenStorage.getToken();
    if (token == null) return null;

    final url = Uri.parse("$baseUrl/me");

    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    // token expired
    if (response.statusCode == 401) {
      return await refreshToken();
    }

    return null;
  }

  // =================================================
  // REFRESH TOKEN
  // =================================================
  static Future<Map<String, dynamic>?> refreshToken() async {
    final token = await TokenStorage.getToken();
    if (token == null) return null;

    final url = Uri.parse("$baseUrl/refresh");

    final response = await http.post(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newToken = data["data"]["token"];
      await TokenStorage.saveToken(newToken);
      return data;
    }

    // refresh gagal → logout
    await TokenStorage.clearToken();
    return null;
  }

  // =================================================
  // LOGOUT
  // =================================================
  static Future<void> logout() async {
    final token = await TokenStorage.getToken();
    
    if (token != null) {
      final url = Uri.parse("$baseUrl/logout");
      await http.post(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
    }

    await TokenStorage.clearToken(); // tetap hapus token lokal
  }
}

