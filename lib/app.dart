import 'package:flutter/material.dart';
import 'package:talkr_chat_app/core/go_router/go_router.dart';
import 'package:talkr_chat_app/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeManager.craeteTheme(AppThemeLight()),
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
