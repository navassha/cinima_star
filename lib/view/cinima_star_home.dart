// ignore_for_file: unrelated_type_equality_checks
import 'package:cinima_star/services/textediting_provider.dart';
import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:cinima_star/view/profile.dart';
import 'package:cinima_star/view/search_page.dart';
import 'package:cinima_star/view/trending_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/dark_mode_provider.dart';
import '../services/page_controller.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/drawer.dart';
import 'downloads_page.dart';

// ignore: must_be_immutable
class CinimaStarHome extends ConsumerWidget {
  CinimaStarHome({super.key});

  PageController controller = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signdetails = ref.watch(signupprovider);
    final darkmodehome = ref.watch(darkModeProvider);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GestureDetector(
      // onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: ResMobSize.width(70, context),
          actions: const <Widget>[SizedBox()],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            children: [
              SizedBox(
                height: ResMobSize.width(10, context),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Hello',
                          style: TextStyle(
                            fontFamily: "Poppins Bold",
                            color: ref.watch(darkModeProvider) == false
                                ? Colors.black
                                : Colors.white,
                            fontSize: ResMobSize.width(24, context),
                          ),
                          children: [
                            TextSpan(
                              text: signdetails.firstname.text != ''
                                  ? ' ${signdetails.firstname.text}!'
                                  : "User!",
                              style: const TextStyle(
                                fontFamily: 'Poppins regular',
                              ),
                            )
                          ],
                        ),
                      ),
                      ref.watch(bottamProvider) == 2
                          ? Text(
                              overflow: TextOverflow.ellipsis,
                              "Search You're Favorite Movie",
                              style: TextStyle(
                                fontSize: ResMobSize.width(17, context),
                                color: ref.watch(darkModeProvider) == false
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: "Poppins regular",
                              ),
                            )
                          : ref.watch(bottamProvider) == 3
                              ? Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Edit You're Profile Here",
                                  style: TextStyle(
                                    fontSize: ResMobSize.width(17, context),
                                    color: ref.watch(darkModeProvider) == false
                                        ? Colors.black
                                        : Colors.white,
                                    fontFamily: "Poppins regular",
                                  ),
                                )
                              : Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Watch You're Favorite Movies",
                                  style: TextStyle(
                                    fontSize: ResMobSize.width(17, context),
                                    color: ref.watch(darkModeProvider) == false
                                        ? Colors.black
                                        : Colors.white,
                                    fontFamily: "Poppins regular",
                                  ),
                                ),
                    ],
                  ),
                  const Spacer(),
                  Builder(
                    builder: (context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: CircleAvatar(
                          radius: ResMobSize.width(27, context),
                          backgroundImage: const NetworkImage(
                            "https://i.pinimg.com/736x/ae/3d/f9/ae3df9f7e3ea4c28ecc08f43aa515bd8.jpg",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        extendBody: true,
        backgroundColor:
            ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
        body: Padding(
          padding: EdgeInsets.all(
            ResMobSize.width(15, context),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      ref.read(bottamProvider.notifier).state = value;
                    },
                    children: [
                      // CinimaStarSearch(),
                      TrendingHomePage(),
                      const DownloadsPage(),
                      CinimaStarSearch(),
                      const ProfilePage()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        /// there is maked the drawer and called to the ontap
        ///
        endDrawer: CinimaStarDrawer(darkmodehome: darkmodehome),
        bottomNavigationBar: BottomaNavigation(controller: controller),
      ),
    );
  }
}
