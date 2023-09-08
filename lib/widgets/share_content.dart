import 'package:flutter/cupertino.dart';

import '../utils/cinima_star_responsive.dart';

class ShareContiner extends StatelessWidget {
  final String image;
  ShareContiner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResMobSize.width(60, context),
      height: ResMobSize.width(60, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          ResMobSize.width(15, context),
        ),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
