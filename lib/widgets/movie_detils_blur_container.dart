import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/cinima_star_responsive.dart';

// ignore: must_be_immutable
class MoviePageBlurContainer extends StatelessWidget {
  Icon icon;
  MoviePageBlurContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ResMobSize.width(20, context)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: ResMobSize.width(50, context),
          height: ResMobSize.width(50, context),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(
              ResMobSize.width(20, context),
            ),
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
