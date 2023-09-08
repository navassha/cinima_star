import 'package:cinima_star/services/dark_mode_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/cinima_star_responsive.dart';

// ignore: must_be_immutable
class SettingsItems extends ConsumerWidget {
  String text;
  Icon icon;
  SettingsItems({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        width: ResMobSize.width(290, context),
        height: ResMobSize.width(60, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ResMobSize.width(20, context),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResMobSize.width(15, context),
          ),
          child: Row(
            children: [
              CircleAvatar(
                  radius: ResMobSize.width(20, context),
                  backgroundColor: Colors.teal[200],
                  child: icon),
              SizedBox(
                width: ResMobSize.width(15, context),
              ),
              Text(
                text,
                style: TextStyle(
                    color: ref.watch(darkModeProvider) == false
                        ? Colors.black
                        : Colors.white,
                    fontSize: ResMobSize.width(17, context),
                    fontFamily: 'Poppins regular'),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.right_chevron,
                size: ResMobSize.width(20, context),
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
