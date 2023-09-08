import 'package:flutter/material.dart';
import '../utils/cinima_star_responsive.dart';

class DrawerContent extends StatelessWidget {
  final String text;
  final Icon keyicon;
  const DrawerContent({super.key, required this.text, required this.keyicon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResMobSize.width(50, context),
      child: Row(
        children: [
          SizedBox(
            width: ResMobSize.width(20, context),
          ),
          keyicon,
          SizedBox(
            width: ResMobSize.width(10, context),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: ResMobSize.width(18, context),
              fontFamily: 'Poppins regular',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
