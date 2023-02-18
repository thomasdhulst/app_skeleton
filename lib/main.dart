import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:virtuose/logic/app_logic.dart';
import 'package:virtuose/logic/settings_logic.dart';
import 'package:virtuose/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep native splash screen up until app is finished bootstrapping
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Start app
  _registerSingletons();
  runApp(const VirtuoApp());
  await appLogic.bootstrap();

  // Remove splash screen when bootstrap is complete
  FlutterNativeSplash.remove();
}

/// Create singletons (logic and services) that can be shared across the app.
void _registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  // Wonders
  // GetIt.I.registerLazySingleton<WondersLogic>(() => WondersLogic());
  // // Timeline / Events
  // GetIt.I.registerLazySingleton<TimelineLogic>(() => TimelineLogic());
  // // Search
  // GetIt.I.registerLazySingleton<MetAPILogic>(() => MetAPILogic());
  // GetIt.I.registerLazySingleton<MetAPIService>(() => MetAPIService());
  // Settings
  GetIt.I.registerLazySingleton<SettingsLogic>(() => SettingsLogic());
  // // Unsplash
  // GetIt.I.registerLazySingleton<UnsplashLogic>(() => UnsplashLogic());
  // // Collectibles
  // GetIt.I.registerLazySingleton<CollectiblesLogic>(() => CollectiblesLogic());
  // // Localizations
  // GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
SettingsLogic get settingsLogic => GetIt.I.get<SettingsLogic>();

class VirtuoApp extends StatelessWidget {
  const VirtuoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Raleway',
      ),
    );
  }
}
