import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../data/models/user.dart';

class ProfileCache {
  static const String _keyPrefix = 'user_cache_';

  Future<User?> getUser(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('$_keyPrefix$userId');

    if (jsonString == null) return null;

    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return User.fromJson(jsonMap);
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = json.encode({
      'id': user.id,
      'first_name': user.firstName,
      'last_name': user.lastName,
      'avatar': user.avatarUrl,
    });

    await prefs.setString('$_keyPrefix${user.id}', jsonString);
  }
}
