import 'package:riverpod/riverpod.dart';
import 'profile_controller.dart';
import '../../data/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  throw UnimplementedError('Injecté par le SDK');
});

final profileControllerProvider =
    StateNotifierProvider.family<ProfileController, ProfileState, int>((
      ref,
      userId,
    ) {
      final repo = ref.watch(userRepositoryProvider);
      return ProfileController(repository: repo, userId: userId);
    });
