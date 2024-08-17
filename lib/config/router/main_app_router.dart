import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/features/widgets/presentation/screens/screens.dart';

final GoRouter MainAppRouter = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (BuildContext context, GoRouterState state) {
        return const ButtonsScreen();
      },
    ),
    GoRoute(
      name: CardsScreen.name,
      path: "/cards",
      builder: (context, GoRouterState state) {
        return const CardsScreen();
      },
    ),
    GoRoute(
      path: "/progress",
      name: ProgressScreen.name,
      builder: (context, GoRouterState state) {
        return const ProgressScreen();
      },
    ),
    GoRoute(
      path: "/snackbar",
      name: SnackbarScreen.name,
      builder: (context, state) {
        return const SnackbarScreen();
      },
    ),
    GoRoute(
      path: "/animated_container",
      name: AnimatedScreen.name,
      builder: (context, state) {
        return const AnimatedScreen();
      },
    ),
    GoRoute(
      path: "/ui_controls",
      name: UiControlsScreen.name,
      builder: (context, state) {
        return const UiControlsScreen();
      },
    ),
    GoRoute(
      path: "/app_tutorial",
      name: AppTutorialScreen.name,
      builder: (context, state) {
        return const AppTutorialScreen();
      },
    ),
    GoRoute(
      path: "/infinite_scroll",
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    )
  ],
);
