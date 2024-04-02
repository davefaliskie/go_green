import 'package:go_green/game/game_screen.dart';
import 'package:go_green/views/menu_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  menu,
  game,
}

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/menu',
    routes: <RouteBase>[
      GoRoute(
        path: '/game',
        name: AppRoute.game.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const GameScreen(),
        ),
      ),
      GoRoute(
        path: '/menu',
        name: AppRoute.menu.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const MenuScreen(),
        ),
      ),
    ],
  );
}
