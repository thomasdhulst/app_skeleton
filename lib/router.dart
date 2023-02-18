import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virtuose/main.dart';
import 'package:virtuose/ui/screens/home/home_screen.dart';
import 'package:virtuose/ui/screens/intro/intro_screen.dart';
import 'package:virtuose/ui/screens/splash/splash.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
}

// GoRouter configuration
final appRouter = GoRouter(
  redirect: _handleRedirect,
  routes: [
    AppRoute(
        ScreenPaths.splash, (_) => const SplashScreen()), // This will be hidden
    AppRoute(ScreenPaths.home, (_) => const HomeScreen()),
    AppRoute(ScreenPaths.intro, (_) => const IntroScreen()),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            return useFade
                ? CustomTransitionPage(
                    key: state.pageKey,
                    child: pageContent,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  )
                : CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}

FutureOr<String?> _handleRedirect(BuildContext context, GoRouterState state) {
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (!appLogic.isBootstrapComplete && state.location != ScreenPaths.splash) {
    return ScreenPaths.splash;
  }
  debugPrint('Navigate to: ${state.location}');
  return null; // do nothing
}
