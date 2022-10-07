import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  _AppStoreBase() {
    _loadThemePreference();
  }

  @observable
  ThemeData? theme;

  @computed
  bool get isDark => theme?.brightness == Brightness.dark;

  @action
  void changeTheme() {
    theme = isDark ? ThemeData.light() : ThemeData.dark();
    _saveThemePreference();
  }

  void _saveThemePreference() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isDark', isDark);
    });
  }

  void _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    theme = prefs.getBool('isDark')! ? ThemeData.dark() : ThemeData.light();
  }
}
