import '../models/user.dart';
import '../datasources/user_remote_data_source.dart';
import '../../core/cache/profile_cache.dart';

class UserRepository {
  final UserRemoteDataSource remote;
  final ProfileCache cache;

  UserRepository({required this.remote, required this.cache});

  Future<User> getUser(int userId, {bool forceRefresh = false}) async {
    // 1) Lecture cache si pas de refresh
    if (!forceRefresh) {
      final cached = await cache.getUser(userId);
      if (cached != null) return cached;
    }

    // 2) Sinon appel API
    final user = await remote.getMe(userId);

    // 3) Mise en cache
    await cache.saveUser(user);

    return user;
  }
}
