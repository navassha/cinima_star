import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../services/page_controller.dart';
import '../utils/cinima_star_responsive.dart';

class BottomaNavigation extends ConsumerWidget {
  const BottomaNavigation({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: ResMobSize.width(80, context),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(115, 0, 0, 0),
        Color.fromARGB(255, 0, 0, 0)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      padding: EdgeInsets.symmetric(horizontal: ResMobSize.width(10, context)),
      child: GNav(
        // onTabChange: ,
        selectedIndex: ref.watch(bottamProvider),
        onTabChange: (value) {
          controller.jumpToPage(
            value,
            // duration: const Duration(milliseconds: 500),
            // curve: Curves.ease,
          );
        },
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.white, width: .8),
        tabBorder: Border.all(color: Colors.grey.shade100, width: 1.5),

        curve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 500),
        gap: 4,
        color: Colors.white,

        iconSize: 24,
        tabBackgroundColor: Colors.white,

        padding: EdgeInsets.symmetric(
          horizontal: ResMobSize.width(10, context),
          vertical: ResMobSize.width(5, context),
        ),
        tabs: [
          GButton(
            icon: CupertinoIcons.home,
            text: 'Home',
            iconColor: Colors.white,
            textStyle: TextStyle(
              fontFamily: "Poppins regular",
              color: Colors.black,
              fontSize: ResMobSize.width(15, context),
            ),
          ),
          GButton(
            icon: CupertinoIcons.square_arrow_down,
            text: 'Downloads',
            iconColor: Colors.white,
            textStyle: TextStyle(
              fontFamily: "Poppins regular",
              color: Colors.black,
              fontSize: ResMobSize.width(15, context),
            ),
          ),
          GButton(
            icon: CupertinoIcons.search,
            text: 'Search',
            iconColor: Colors.white,
            textStyle: TextStyle(
              fontFamily: "Poppins regular",
              color: Colors.black,
              fontSize: ResMobSize.width(15, context),
            ),
          ),
          GButton(
            icon: CupertinoIcons.person,
            iconColor: Colors.white,
            text: 'Profile',
            textStyle: TextStyle(
              fontFamily: "Poppins regular",
              color: Colors.black,
              fontSize: ResMobSize.width(15, context),
            ),
          )
        ],
      ),
    );
  }
}
