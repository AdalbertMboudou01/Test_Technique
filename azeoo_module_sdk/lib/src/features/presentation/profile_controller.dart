import 'package:riverpod/riverpod.dart';

import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class ProfileState {
  final AsyncValue<User> user;

  const ProfileState({required this.user});

  ProfileState copyWith({AsyncValue<User>? user}) {
    return ProfileState(user: user ?? this.user);
  }

  static ProfileState initial() => ProfileState(user: const AsyncLoading());
}

class ProfileController extends StateNotifier<ProfileState> {
  final UserRepository repository;
  final int userId;

  ProfileController({required this.repository, required this.userId})
    : super(ProfileState.initial()) {
    loadProfile();
  }

  Future<void> loadProfile({bool forceRefresh = false}) async {
    state = state.copyWith(user: const AsyncLoading());

    try {
      final result = await repository.getUser(
        userId,
        forceRefresh: forceRefresh,
      );
      state = state.copyWith(user: AsyncData(result));
    } catch (e, st) {
      state = state.copyWith(user: AsyncError(e, st));
    }
  }

  Future<void> refresh() => loadProfile(forceRefresh: true);
}
