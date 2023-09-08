import 'package:flutter/cupertino.dart';

import '../utils/cinima_star_responsive.dart';

class SignUpContainer extends StatelessWidget {
  final String link;
  final String text;
  SignUpContainer({super.key, required this.link, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: ResMobSize.width(50, context),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(
          ResMobSize.width(
            25,
            context,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ResMobSize.width(20, context),
            width: ResMobSize.width(20, context),
            child: Image.network(link),
          ),
          SizedBox(
            width: ResMobSize.width(5, context),
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: "poppins regular",
              fontSize: ResMobSize.width(17, context),
            ),
          )
        ],
      ),
    );
  }
}
