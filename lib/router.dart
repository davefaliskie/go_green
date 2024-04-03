import 'package:go_green/game/game_screen.dart';
import 'package:go_green/game_end_state.dart';
import 'package:go_green/views/end_screen.dart';
import 'package:go_green/views/menu_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  menu,
  game,
  endTrash,
  endWater,
  endFire,
  endRecycle,
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
      GoRoute(
        path: '/endTrash',
        name: AppRoute.endTrash.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const EndScreen(gameEndState: GameEndState.trash),
        ),
      ),
      GoRoute(
        path: '/endWater',
        name: AppRoute.endWater.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const EndScreen(gameEndState: GameEndState.water),
        ),
      ),
      GoRoute(
        path: '/endFire',
        name: AppRoute.endFire.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const EndScreen(gameEndState: GameEndState.fire),
        ),
      ),
      GoRoute(
        path: '/endRecycle',
        name: AppRoute.endRecycle.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const EndScreen(gameEndState: GameEndState.recycle),
        ),
      ),
    ],
  );
}
