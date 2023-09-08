import 'package:cinima_star/widgets/sighnout_dailog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/dark_mode_provider.dart';
import '../services/page_controller.dart';
import '../services/textediting_provider.dart';
import '../utils/cinima_star_responsive.dart';
import '../view/cinimastar_login.dart';
import '../view/discover_page.dart';
import 'drawer_row.dart';

class CinimaStarDrawer extends ConsumerWidget {
  const CinimaStarDrawer({
    super.key,
    required this.darkmodehome,
  });

  final bool darkmodehome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: const Color(0x3B000000),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: ResMobSize.width(380, context),
              child: Stack(
                children: [
                  Positioned(
                    left: ResMobSize.width(10, context),
                    bottom: ResMobSize.width(30, context),
                    child: CircleAvatar(
                      radius: ResMobSize.width(200, context),
                      backgroundColor: darkmodehome == true
                          ? const Color(0xFFDADADA)
                          : const Color(0xFF292929),
                      child: CircleAvatar(
                        radius: ResMobSize.width(160, context),
                        backgroundColor: darkmodehome == true
                            ? const Color(0xFF8A8A8A)
                            : const Color(0xFF424242),
                        child: CircleAvatar(
                          radius: ResMobSize.width(120, context),
                          backgroundColor: darkmodehome == true
                              ? const Color(0xFF646464)
                              : const Color(0xFF6A6A6A),
                          child: CircleAvatar(
                            radius: ResMobSize.width(80, context),
                            backgroundImage: const NetworkImage(
                              "https://i.pinimg.com/736x/ae/3d/f9/ae3df9f7e3ea4c28ecc08f43aa515bd8.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                ref.read(bottamProvider.notifier).state = 0;
              },
              borderRadius: BorderRadius.circular(
                ResMobSize.width(20, context),
              ),
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: DrawerContent(
                text: "Home",
                keyicon: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                  size: ResMobSize.width(20, context),
                ),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(15, context),
            ),
            DrawerContent(
              text: "Liked",
              keyicon: Icon(
                CupertinoIcons.suit_heart,
                color: Colors.white,
                size: ResMobSize.width(20, context),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(15, context),
            ),
            DrawerContent(
              text: "Watchlist",
              keyicon: Icon(
                CupertinoIcons.eye,
                color: Colors.white,
                size: ResMobSize.width(20, context),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(15, context),
            ),
            DrawerContent(
              text: "Top Box Office",
              keyicon: Icon(
                CupertinoIcons.tickets,
                color: Colors.white,
                size: ResMobSize.width(20, context),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(15, context),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiscoverPage(),
                  ),
                );
              },
              child: DrawerContent(
                text: "Discover",
                keyicon: Icon(
                  Icons.add_to_queue_outlined,
                  color: Colors.white,
                  size: ResMobSize.width(20, context),
                ),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(15, context),
            ),
            DrawerContent(
              text: "Settings",
              keyicon: Icon(
                CupertinoIcons.settings_solid,
                color: Colors.white,
                size: ResMobSize.width(20, context),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(15, context),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: const SignOutDailog(),
                    actions: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: ResMobSize.width(120, context),
                          height: ResMobSize.width(40, context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              ResMobSize.width(15, context),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: 'Poppins regular',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ResMobSize.width(10, context),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CinimaStarLogin(),
                            ),
                          );
                          ref.read(bottamProvider.notifier).state = 0;
                          ref.read(signupprovider).firstname.text = '';
                          ref.read(signupprovider).lastname.text = '';
                          ref.read(signupprovider).emails.text = '';
                          ref.read(signupprovider).passwords.text = '';
                        },
                        child: Container(
                          width: ResMobSize.width(120, context),
                          height: ResMobSize.width(40, context),
                          decoration: BoxDecoration(
                            color: const Color(0xFF04C1AE),
                            borderRadius: BorderRadius.circular(
                              ResMobSize.width(15, context),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                fontFamily: 'Poppins regular',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: ResMobSize.width(20, context),
                  ),
                  Icon(
                    CupertinoIcons.square_arrow_right,
                    size: ResMobSize.width(20, context),
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: ResMobSize.width(10, context),
                  ),
                  Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: ResMobSize.width(18, context),
                      fontFamily: 'Poppins regular',
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: ResMobSize.width(30, context),
            ),
            InkWell(
              onTap: () {
                ref.read(darkModeProvider.notifier).state =
                    !ref.read(darkModeProvider.notifier).state;
              },
              child: Container(
                width: ResMobSize.width(140, context),
                height: ResMobSize.width(35, context),
                decoration: BoxDecoration(
                  color: const Color(0xFF1DA497),
                  borderRadius: BorderRadius.circular(
                    ResMobSize.width(13, context),
                  ),
                ),
                child: Center(
                  child: ref.watch(darkModeProvider) == false
                      ? Text(
                          "Night Mode",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ResMobSize.width(15, context),
                            fontFamily: 'Poppins regular',
                          ),
                        )
                      : Text(
                          "Light Mode",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ResMobSize.width(15, context),
                            fontFamily: 'Poppins regular',
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: ResMobSize.width(30, context),
            ),
          ],
        ),
      ),
    );
  }
}
