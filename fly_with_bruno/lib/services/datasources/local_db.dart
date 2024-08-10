import 'dart:convert';

import 'package:fly_with_bruno/models/profile_data.dart';
import 'package:fly_with_bruno/services/datasources/source.dart';
import 'package:http/http.dart';

class LocalDbImpl implements Source {
  @override
  Future<ProfileData> getProfile() async {
    final url = Uri.parse("http://localhost:3000/user");
    final response = await get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = ProfileData.fromJson(json);
      return data;
    } else {
      throw Exception("status code ${response.statusCode}");
    }
  }
}
