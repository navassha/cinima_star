// ignore_for_file: unrelated_type_equality_checks

import 'package:cinima_star/services/dark_mode_provider.dart';
import 'package:cinima_star/services/textediting_provider.dart';
import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/page_controller.dart';
import '../widgets/settings_page_items.dart';
import '../widgets/sighnout_dailog.dart';
import 'cinimastar_login.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:
          ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: ResMobSize.width(150, context),
              height: ResMobSize.width(150, context),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://i.pinimg.com/736x/ae/3d/f9/ae3df9f7e3ea4c28ecc08f43aa515bd8.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  ResMobSize.width(75, context),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: ResMobSize.width(110, context),
                  left: ResMobSize.width(100, context),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: ResMobSize.width(17, context),
                    backgroundColor: Colors.cyan,
                    child: Icon(
                      CupertinoIcons.pencil_outline,
                      color: Colors.white,
                      size: ResMobSize.width(20, context),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ResMobSize.width(50, context),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    width: MediaQuery.of(context).size.width,
                    height: ResMobSize.width(100, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        ResMobSize.width(20, context),
                      ),
                      color: ref.watch(darkModeProvider) == false
                          ? Colors.white
                          : Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(
                          ResMobSize.width(10, context),
                        ),
                        child: TextField(
                          controller: ref.watch(signupprovider).firstname,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(
                              ResMobSize.width(10, context),
                            ),
                            hintText: 'Edit Your Name',
                            counterStyle:
                                const TextStyle(fontFamily: 'Poppins regular'),
                            hintStyle:
                                const TextStyle(fontFamily: 'Poppins regular'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                ResMobSize.width(20, context),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                ResMobSize.width(20, context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: ResMobSize.width(25, context),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (ref.watch(signupprovider).firstname != '') {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          width: ResMobSize.width(130, context),
                          height: ResMobSize.width(50, context),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 194, 175),
                            borderRadius: BorderRadius.circular(
                              ResMobSize.width(20, context),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Change Name",
                              style: TextStyle(
                                fontFamily: 'Poppins regular',
                                fontSize: ResMobSize.width(14, context),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            borderRadius: BorderRadius.circular(
              ResMobSize.width(30, context),
            ),
            child: SettingsItems(
              text: "Edit You're Name",
              icon: Icon(
                CupertinoIcons.pencil_ellipsis_rectangle,
                color: Colors.white,
                size: ResMobSize.width(20, context),
              ),
            ),
          ),
          SizedBox(
            height: ResMobSize.width(10, context),
          ),
          SettingsItems(
            text: "Privacy Settings",
            icon: Icon(
              CupertinoIcons.doc_text_search,
              size: ResMobSize.width(20, context),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: ResMobSize.width(10, context),
          ),
          SettingsItems(
            text: "Account Settings",
            icon: Icon(
              CupertinoIcons.person,
              size: ResMobSize.width(20, context),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: ResMobSize.width(10, context),
          ),
          SettingsItems(
            text: "Settings",
            icon: Icon(
              CupertinoIcons.settings,
              size: ResMobSize.width(20, context),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: ResMobSize.width(10, context),
          ),
          SettingsItems(
            text: "Change Account",
            icon: Icon(
              CupertinoIcons.rectangle_stack_person_crop,
              size: ResMobSize.width(20, context),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: ResMobSize.width(30, context),
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.square_arrow_right,
                  size: ResMobSize.width(25, context),
                  color: Colors.red,
                ),
                SizedBox(
                  width: ResMobSize.width(10, context),
                ),
                Text(
                  "Sign Out",
                  style: TextStyle(
                    fontFamily: 'Poppins regular',
                    color: Colors.red,
                    fontSize: ResMobSize.width(18, context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
