import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final customTextFieldsProvider =
    Provider<TextController>((ref) => TextController());

class TextController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
}

class SignUpController {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController emails = TextEditingController();
  final TextEditingController passwords = TextEditingController();
}

final signupprovider = Provider<SignUpController>((ref) => SignUpController());
