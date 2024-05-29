import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/common_widgets/responsive/responsive_layout.dart';
import 'package:trial_feature/features/Presentation/table_view/tablet_view.dart';
import 'package:trial_feature/features/Presentation/web_views/app_base_view.dart';
import 'package:trial_feature/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(
      child: ResponsiveLayout(
    mobileScaffold: MyApp(),
    desktopScaffold: MyDesktopApp(),
    tabletScaffold: MyTabletApp(),
  )));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
    );
  }
}

class MyDesktopApp extends ConsumerWidget {
  const MyDesktopApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const WebArticle(),
    );
  }
}

class MyTabletApp extends ConsumerWidget {
  const MyTabletApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
          useMaterial3: true,
        ),
        home: const TabletArticle());
  }
}
