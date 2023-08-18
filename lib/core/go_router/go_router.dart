import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talkr_chat_app/core/shared_preferences/prefs_helper.dart';
import 'package:talkr_chat_app/features/account/presentation/pages/account_page_view.dart';
import 'package:talkr_chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:talkr_chat_app/features/auth/presentation/pages/login_page_view.dart';
import 'package:talkr_chat_app/features/auth/presentation/pages/register_page_view.dart';
import 'package:talkr_chat_app/features/chat/presentation/pages/chat_page_view.dart';
import 'package:talkr_chat_app/features/main/presentation/pages/main_page_view.dart';
import 'package:talkr_chat_app/injection.dart';

import 'error_screen.dart';

final AuthCubit authCubit = getIt<AuthCubit>();

class AppRouter {
  static final _shellProfileNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellHomeNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          if (await SharedPrefsHelper.fromJson("userData") != null) {
            return '/home';
          }
          return '/auth';
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPageView(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
          );
        },
        parentNavigatorKey: navigatorKey,
        branches: [
          StatefulShellBranch(navigatorKey: _shellHomeNavigatorKey, routes: [
            GoRoute(
              parentNavigatorKey: _shellHomeNavigatorKey,
              path: '/home',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ChatPageView()),
              routes: const [],
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellProfileNavigatorKey, routes: [
            GoRoute(
              parentNavigatorKey: _shellProfileNavigatorKey,
              path: '/profile',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: AccountPageView()),
            ),
          ])
        ],
      ),
      // GoRoute(
      //   parentNavigatorKey: navigatorKey,
      //   path: '/product/:id',
      //   pageBuilder: (context, state) => NoTransitionPage(
      //       child: ProductDetailPageView(
      //     cubit: (state.extra as List)[0],
      //     id: (state.extra as List)[1],
      //   )),
      // ),
      GoRoute(
        path: '/auth',
        routes: [
          GoRoute(
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RegisterPageView()),
            path: 'signup',
          ),
          GoRoute(
            path: 'signin',
            pageBuilder: (context, state) => const NoTransitionPage(
                child: LoginPageView(
                    // authCubit: state.extra as AuthCubit,
                    )),
          ),
        ],
        builder: (context, state) {
          return const LoginPageView();
        },
      ),
    ],
  );
}
