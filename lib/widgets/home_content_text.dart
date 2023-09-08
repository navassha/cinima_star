import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/dark_mode_provider.dart';
import '../utils/cinima_star_responsive.dart';

// ignore: must_be_immutable
class ContentText extends ConsumerWidget {
  String text;
  Color color;
  ContentText({
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: TextStyle(
          fontSize: ResMobSize.width(18, context),
          fontWeight: FontWeight.w600,
          color: ref.watch(darkModeProvider) == false
              ? Colors.black
              : Colors.white,
          fontFamily: 'Poppins regular'),
    );
  }
}
