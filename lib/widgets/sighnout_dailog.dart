import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/dark_mode_provider.dart';
import '../utils/cinima_star_responsive.dart';

class SignOutDailog extends ConsumerWidget {
  const SignOutDailog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ResMobSize.width(120, context),
      decoration: BoxDecoration(
        color:
            ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(
          ResMobSize.width(20, context),
        ),
        border: Border.all(
          width: 1,
          color: ref.watch(darkModeProvider) == false
              ? Colors.black
              : Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          "Are you sure! do you want to sign out click here to confirm",
          style: TextStyle(
            fontFamily: 'Poppins regular',
            fontSize: ResMobSize.width(17, context),
            color: ref.watch(darkModeProvider) == false
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
