import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/features/Presentation/mobile_views/views/articles_screen.dart';
import 'package:trial_feature/features/Presentation/mobile_views/views/folder.dart';
import 'package:trial_feature/routing/scaffold_with_nav_bar.dart';

enum RoutePath {
  article(path: '/'),
  folder(path: '/folders');

  const RoutePath({required this.path});
  final String path;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'rootNav');
  return GoRouter(navigatorKey: rootNavKey, routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          // The route branch for the first tab of the bottom navigation bar.
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: RoutePath.article.path,
                  name: RoutePath.article.path,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ArticlesScreen())),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: RoutePath.folder.path,
                  name: RoutePath.folder.path,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: FolderStructure())),
            ],
          ),
        ])
  ]);
});
