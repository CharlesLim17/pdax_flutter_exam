import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdax_flutter_exam/features/screens/person_details_screen.dart';
import 'package:pdax_flutter_exam/features/screens/person_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

List<GoRoute> get routes => [
      // Person List Screen
      GoRoute(
        name: 'PersonListScreen',
        path: '/',
        redirect: (context, state) => '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PersonListScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.ease).animate(animation),
                child: child,
              );
            },
          );
        },
      ),

      // Person Details Screen
      GoRoute(
        name: 'PersonDetailsScreen',
        path: '/details',
        redirect: (context, state) => '/details',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PersonDetailsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.ease).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ];

@riverpod
GoRouter goRoute(GoRouteRef ref) {
  return GoRouter(
    routes: routes,
    initialLocation: '/',
  );
}
