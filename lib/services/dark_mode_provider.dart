import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeModel {
  bool isDarkMode;
  DarkModeModel({this.isDarkMode = false});
}

final darkModeProvider = StateProvider<bool>((ref) => false);
