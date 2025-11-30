import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'profile_providers.dart';

class ProfileScreen extends ConsumerWidget {
  final int userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileControllerProvider(userId));
    final controller = ref.read(profileControllerProvider(userId).notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Profil utilisateur')),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: state.user.when(
          data: (user) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: user.avatarUrl != null
                        ? NetworkImage(user.avatarUrl!)
                        : null,
                    child: user.avatarUrl == null
                        ? Text(
                            user.firstName[0],
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${user.firstName} ${user.lastName}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) {
            final errorMsg = err.toString();

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Icon(Icons.error, color: Colors.red.shade400, size: 48),
                const SizedBox(height: 16),
                const Text(
                  'Une erreur est survenue',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  errorMsg,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () => controller.loadProfile(forceRefresh: true),
                    child: const Text('Réessayer'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
