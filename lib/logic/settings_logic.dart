import 'package:flutter/material.dart';
import 'package:virtuose/logic/common/platform_info.dart';
import 'package:virtuose/logic/common/save_load_mixin.dart';

class SettingsLogic with ThrottledSaveLoadMixin {
  @override
  String get fileName => 'settings.dat';

  late final hasCompletedOnboarding = ValueNotifier<bool>(false)
    ..addListener(scheduleSave);
  // late final currentLocale = ValueNotifier<String?>(null)..addListener(scheduleSave);

  final bool useBlurs = !PlatformInfo.isAndroid;

  @override
  void copyFromJson(Map<String, dynamic> value) {
    hasCompletedOnboarding.value = value['hasCompletedOnboarding'] ?? false;
    // currentLocale.value = value['currentLocale'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hasCompletedOnboarding': hasCompletedOnboarding.value,
      // 'currentLocale': currentLocale.value,
    };
  }

  // Future<void> changeLocale(Locale value) async {
  //   currentLocale.value = value.languageCode;
  //   await localeLogic.loadIfChanged(value);
  //   // Re-init controllers that have some cached data that is localized
  //   wondersLogic.init();
  //   timelineLogic.init();
  // }
}
