import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static const String _themeKey = 'theme'; // Key for SharedPreferences
  static const String _darkTheme = 'dark';
  static const String _lightTheme = 'light';

  // Method to load the theme
  static Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_themeKey) ?? _lightTheme; // Default to light theme
    return theme == _darkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  // Method to save the theme
  static Future<void> saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    String theme = (themeMode == ThemeMode.dark) ? _darkTheme : _lightTheme;
    await prefs.setString(_themeKey, theme);
  }
}
