import 'package:go_router/go_router.dart';

import '../features/presentation/profile_screen.dart';

class AppRouter {
  static GoRouter create({required int userId}) {
    return GoRouter(
      initialLocation: '/profile',
      routes: [
        GoRoute(
          path: '/profile',
          builder: (context, state) => ProfileScreen(userId: userId),
        ),
      ],
    );
  }
}
