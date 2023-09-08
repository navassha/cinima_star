import 'package:cinima_star/services/page_controller.dart';
import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/dark_mode_provider.dart';

class DiscoverPage extends ConsumerWidget {
  const DiscoverPage({super.key});

  final int conttroller = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:
          ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.left_chevron,
            size: ResMobSize.width(20, context),
          ),
        ),
        toolbarHeight: ResMobSize.width(70, context),
        title: Row(
          children: [
            const Spacer(),
            Container(
              width: ResMobSize.width(240, context),
              height: ResMobSize.width(60, context),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: ref.watch(darkModeProvider) == false
                      ? Colors.black
                      : Colors.white,
                ),
                color: Colors.amber,
                image: const DecorationImage(
                  image: AssetImage(
                    "asset/container_backgroud_image.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  ResMobSize.width(25, context),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResMobSize.width(10, context),
                  vertical: ResMobSize.width(5, context),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(discovercontroller.notifier).state = 0;
                      },
                      child: CircleAvatar(
                        radius: ResMobSize.width(23, context),
                        backgroundColor: ref.watch(discovercontroller) == 0
                            ? Colors.white
                            : const Color(0x90FFFFFF),
                        child: DiscoverCircleText(
                          text: 'English',
                        ),
                      ),
                    ),
                    const DisSizedbox(),
                    InkWell(
                      onTap: () {
                        ref.read(discovercontroller.notifier).state = 1;
                      },
                      child: CircleAvatar(
                        radius: ResMobSize.width(23, context),
                        backgroundColor: ref.watch(discovercontroller) == 1
                            ? Colors.white
                            : const Color(0x90FFFFFF),
                        child: DiscoverCircleText(
                          text: 'Hindi',
                        ),
                      ),
                    ),
                    const DisSizedbox(),
                    InkWell(
                      onTap: () {
                        ref.read(discovercontroller.notifier).state = 2;
                      },
                      child: CircleAvatar(
                        radius: ResMobSize.width(23, context),
                        backgroundColor: ref.watch(discovercontroller) == 2
                            ? Colors.white
                            : const Color(0x90FFFFFF),
                        child: DiscoverCircleText(
                          text: 'Tamil',
                        ),
                      ),
                    ),
                    const DisSizedbox(),
                    InkWell(
                      onTap: () {
                        ref.read(discovercontroller.notifier).state = 4;
                      },
                      child: CircleAvatar(
                        radius: ResMobSize.width(23, context),
                        backgroundColor: ref.watch(discovercontroller) == 4
                            ? Colors.white
                            : const Color(0x90FFFFFF),
                        child: DiscoverCircleText(
                          text: 'Mlayalam',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverCircleText extends StatelessWidget {
  final String text;
  DiscoverCircleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        ResMobSize.width(3, context),
      ),
      child: Text(
        overflow: TextOverflow.ellipsis,
        text,
        style: TextStyle(
          fontSize: ResMobSize.width(14, context),
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins regular',
        ),
      ),
    );
  }
}

class DisSizedbox extends StatelessWidget {
  const DisSizedbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResMobSize.width(8, context),
    );
  }
}
