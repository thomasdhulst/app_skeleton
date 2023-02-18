import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virtuose/main.dart';
import 'package:virtuose/router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Text('ON_BOARDING ZONE'),
            TextButton(
              onPressed: () => _handlePress(context),
              child: Text('VALIDE LE ON_BOARDING'),
            )
          ],
        ),
      ),
    );
  }

  void _handlePress(BuildContext context) {
    context.go(ScreenPaths.home);
    settingsLogic.hasCompletedOnboarding.value = true;
  }
}
