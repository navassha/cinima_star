import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cinimastar_login.dart';

class CinimaStarGetstarded extends StatelessWidget {
  const CinimaStarGetstarded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: ResMobSize.width(490, context),
              // color: Colors.amber,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: ResMobSize.width(400, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          ResMobSize.width(80, context),
                        ),
                        bottomRight: Radius.circular(
                          ResMobSize.width(80, context),
                        ),
                      ),
                      color: const Color(0xff121c35),
                    ),
                  ),
                  Positioned(
                    left: ResMobSize.width(115, context),
                    top: ResMobSize.width(320, context),
                    child: CircleAvatar(
                      radius: ResMobSize.width(80, context),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ResMobSize.width(73, context),
                        ),
                        child: CircleAvatar(
                          radius: ResMobSize.width(73, context),
                          child: Image.asset(
                            "asset/giphy.gif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Cinima Star",
              style: TextStyle(
                  fontSize: ResMobSize.width(34, context),
                  fontFamily: 'Poppins regular'),
            ),
            Text(
              "A Platform With You're Favorite Movies",
              style: TextStyle(
                fontSize: ResMobSize.width(15, context),
                fontFamily: 'Poppins regular',
              ),
            ),
            SizedBox(
              height: ResMobSize.width(25, context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResMobSize.width(80, context),
          vertical: ResMobSize.width(15, context),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const CinimaStarLogin(),
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (_, a, w, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
          borderRadius: BorderRadius.circular(
            ResMobSize.width(25, context),
          ),
          child: Ink(
            width: ResMobSize.width(190, context),
            height: ResMobSize.width(50, context),
            decoration: BoxDecoration(
              color: const Color(0xffa3fb81),
              borderRadius: BorderRadius.circular(
                ResMobSize.width(25, context),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Let's Get Started",
                    style: TextStyle(
                      fontFamily: "Poppins regular",
                      fontSize: ResMobSize.width(15, context),
                    ),
                  ),
                  SizedBox(
                    width: ResMobSize.width(10, context),
                  ),
                  Icon(
                    CupertinoIcons.arrowtriangle_right_circle_fill,
                    color: Colors.black,
                    size: ResMobSize.width(20, context),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
