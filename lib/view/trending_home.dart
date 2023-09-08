import 'package:cinima_star/services/dark_mode_provider.dart';
import 'package:cinima_star/services/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_controllel.dart';
import '../utils/cinima_star_responsive.dart';
import '../widgets/home_content_text.dart';
import '../widgets/top_rated_movies.dart';
import '../widgets/trending_day_caruosel.dart';
import '../widgets/trending_selction.dart';
import '../widgets/trending_week_crousel.dart';
import '../widgets/upcoming_movie.dart';

// ignore: must_be_immutable
class TrendingHomePage extends ConsumerWidget {
  TrendingHomePage({super.key});
  int activeindex = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendinghome = ref.watch(getpostsprovider);

    return Scaffold(
      backgroundColor:
          ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
      body: trendinghome.when(
        data: (data) {
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "#",
                        style: TextStyle(
                          fontSize: ResMobSize.width(20, context),
                          fontFamily: "Poppins italic",
                          color: const Color(0xff13f6e2),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Trending",
                            style: TextStyle(
                              color: ref.watch(darkModeProvider) == false
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const TrendingContainer()
                  ],
                ),
                SizedBox(
                  height: ResMobSize.width(10, context),
                ),
                ref.watch(trendingcontrooller) == 0
                    ? const TrendingDay()
                    : const TrendingWeek(),
                SizedBox(
                  height: ResMobSize.width(30, context),
                ),
                ContentText(
                  text: "Recommended",
                  color: Colors.black,
                ),
                SizedBox(
                  height: ResMobSize.width(10, context),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: ResMobSize.width(250, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ResMobSize.width(10, context),
                    ),
                    image: const DecorationImage(
                      image: AssetImage("asset/container_backgroud_image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const UpcomingMovies(),
                ),
                SizedBox(
                  height: ResMobSize.width(30, context),
                ),
                ContentText(
                  text: "Top Rated",
                  color: Colors.black,
                ),
                SizedBox(
                  height: ResMobSize.width(10, context),
                ),
                const TopRatedMovies(),
                SizedBox(
                  height: ResMobSize.width(100, context),
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) => const Center(
          child: Text("Somthing went Wrong"),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
