import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

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
    )
  ],
);
