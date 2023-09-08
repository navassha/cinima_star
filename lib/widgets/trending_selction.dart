import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/page_controller.dart';
import '../utils/cinima_star_responsive.dart';

class TrendingContainer extends ConsumerWidget {
  const TrendingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ResMobSize.width(20, context),
        ),
        color: const Color.fromARGB(161, 0, 187, 212),
      ),
      child: Ink(
        width: ResMobSize.width(200, context),
        height: ResMobSize.width(50, context),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                "asset/container_backgroud_image.jpg",
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(
            ResMobSize.width(20, context),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            ResMobSize.width(7, context),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  ref.read(trendingcontrooller.notifier).state = 0;
                },
                child: Container(
                  width: ResMobSize.width(87, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ResMobSize.width(15, context),
                    ),
                    color: ref.watch(trendingcontrooller) == 0
                        ? const Color.fromARGB(111, 255, 255, 255)
                        : Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: ref.watch(trendingcontrooller) == 0
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Today",
                      style: TextStyle(
                          fontFamily: 'Poppins regular',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  ref.read(trendingcontrooller.notifier).state = 1;
                },
                child: Container(
                  width: ResMobSize.width(87, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ResMobSize.width(15, context),
                    ),
                    color: ref.watch(trendingcontrooller) == 1
                        ? const Color.fromARGB(111, 255, 255, 255)
                        : Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: ref.watch(trendingcontrooller) == 1
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Week",
                      style: TextStyle(
                        fontFamily: 'Poppins regular',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
