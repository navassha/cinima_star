import 'package:flutter/material.dart';
import '../utils/cinima_star_responsive.dart';

// ignore: must_be_immutable
class MovieDetailsButtons extends StatelessWidget {
  Icon icon;
  MovieDetailsButtons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResMobSize.width(50, context),
      height: ResMobSize.width(50, context),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(
          ResMobSize.width(30, context),
        ),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
