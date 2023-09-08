import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_controllel.dart';
import '../utils/cinima_star_responsive.dart';
import '../view/movie_details.dart';

class TrendingDay extends ConsumerWidget {
  const TrendingDay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingDay = ref.watch(getpostsprovider);
    return trendingDay.when(
      data: (data) {
        if (data == null) {
          const Center(
            child: Text("Somthing Went Wrong!"),
          );
        }
        return CarouselSlider.builder(
          itemCount: data!.results!.length,
          itemBuilder: (context, index, realIndex) {
            final String? urlimage = data.results![index].posterPath;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieShowPage(
                      moviepage: data.results![index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResMobSize.width(20, context),
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: ResMobSize.width(5, context),
                ),
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w780$urlimage",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(
                    CupertinoIcons.xmark_circle,
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            padEnds: false,
            // viewportFraction: 1.6,
            autoPlayCurve: Curves.easeIn,
            height: 400,
            autoPlay: true,
            pageSnapping: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            clipBehavior: Clip.antiAlias,
            animateToClosest: true,
            // scrollDirection: Axis.vertical,
            autoPlayInterval: const Duration(seconds: 3),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Icon(CupertinoIcons.xmark_circle),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
