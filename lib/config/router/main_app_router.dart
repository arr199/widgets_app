import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screens.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

final GoRouter MainAppRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'buttons',
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonsScreen();
          },
        ),
        GoRoute(
          path: "cards",
          builder: (context, GoRouterState state) {
            return const CardsScreen();
          },
        )
      ],
    ),
  ],
);