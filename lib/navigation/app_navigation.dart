import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/home/home_view.dart';
import '../views/home/sub_home_view.dart';
import '../views/settings/settings_view.dart';
import '../views/settings/sub_setting_view.dart';
import '../views/nav_screen/nav_screen.dart';
import 'app_routes.dart';

class AppNavigation {
  AppNavigation._();
  static String initial = AppRoutes.home;
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavBarScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.home,
                name: AppRoutesName.home,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeView(),
                routes: [
                  GoRoute(
                    path: AppRoutes.subHome,
                    name: AppRoutesName.subHome,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: const SubHomeView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settings,
                name: AppRoutesName.settings,
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsView(),
                routes: [
                  GoRoute(
                    path: AppRoutes.subsettings,
                    name: AppRoutesName.subsettings,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: const SubSettingsView(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
