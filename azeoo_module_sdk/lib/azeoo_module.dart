import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Core
import 'package:azeoo_module_sdk/src/core/cache/profile_cache.dart';
import 'package:azeoo_module_sdk/src/core/network/api_client.dart';

// Data
import 'package:azeoo_module_sdk/src/data/datasources/user_remote_data_source.dart';
import 'package:azeoo_module_sdk/src/data/repositories/user_repository.dart';

// Features
import 'package:azeoo_module_sdk/src/features/presentation/profile_providers.dart';

// Routing
import 'package:azeoo_module_sdk/src/routing/app_router.dart';

class AzeooSdkConfig {
  final String baseUrl;
  final String authToken;

  const AzeooSdkConfig({required this.baseUrl, required this.authToken});
}

class AzeooSdk {
  static AzeooSdkConfig? _config;

  static void init(AzeooSdkConfig config) {
    _config = config;
  }

  static Widget profileScreen({required int userId}) {
    if (_config == null) {
      throw StateError(
        'AzeooSdk non initialisé. Appelez AzeooSdk.init() avant.',
      );
    }
    final apiClient = ApiClient(
      baseUrl: _config!.baseUrl,
      authToken: _config!.authToken,
      userId: userId,
    );
    final cache = ProfileCache();
    final remote = UserRemoteDataSource(apiClient);
    final repo = UserRepository(remote: remote, cache: cache);

    final router = AppRouter.create(userId: userId);

    return ProviderScope(
      overrides: [userRepositoryProvider.overrideWithValue(repo)],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
