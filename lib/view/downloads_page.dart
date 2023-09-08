import 'package:cinima_star/services/dark_mode_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/cinima_star_responsive.dart';

// ignore: must_be_immutable
class DownloadsPage extends ConsumerWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:
          ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
      body: Center(
        child: Text(
          "No Downloads Yet!",
          style: TextStyle(
            color: ref.watch(darkModeProvider) == false
                ? Colors.black
                : Colors.white,
            fontFamily: 'Poppins regular',
            fontSize: ResMobSize.width(20, context),
          ),
        ),
      ),
    );
  }
}
