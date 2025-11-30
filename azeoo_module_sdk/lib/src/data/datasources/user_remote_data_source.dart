import '../models/user.dart';
import '../../core/network/api_client.dart';

class UserRemoteDataSource {
  final ApiClient client;

  UserRemoteDataSource(this.client);

  Future<User> getMe(int userId) async {
    final response = await client.get<Map<String, dynamic>>(
      '/v1/users/me', // <-- IMPORTANT !
      headers: {'X-User-Id': userId.toString()},
    );

    return User.fromJson(response.data!);
  }
}
