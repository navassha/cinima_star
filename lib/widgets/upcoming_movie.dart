import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinima_star/view/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/up_coming.dart';
import '../utils/cinima_star_responsive.dart';

class UpcomingMovies extends ConsumerWidget {
  const UpcomingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingMovies = ref.watch(upcomgetposts);
    return upcomingMovies.when(
      data: (data) => Container(
        width: MediaQuery.of(context).size.width,
        height: ResMobSize.width(250, context),
        decoration: BoxDecoration(
          color: const Color.fromARGB(186, 0, 150, 135),
          borderRadius: BorderRadius.circular(
            ResMobSize.width(10, context),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            ResMobSize.width(10, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming Movies",
                style: TextStyle(
                  fontSize: ResMobSize.width(18, context),
                  color: Colors.white,
                  fontFamily: 'Poppins regular',
                ),
              ),
              SizedBox(
                height: ResMobSize.width(5, context),
              ),
              CarouselSlider.builder(
                itemCount: data!.results!.length,
                itemBuilder: (context, index, realIndex) {
                  final String? urlimage = data.results![index].posterPath;
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ResMobSize.width(5, context),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieShowPage(moviepage: data.results![index]),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: "https://image.tmdb.org/t/p/w500$urlimage",
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(CupertinoIcons.xmark_circle),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: ResMobSize.width(197, context),
                  pageSnapping: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  clipBehavior: Clip.antiAlias,
                  animateToClosest: true,
                  autoPlay: true,
                ),
              )
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Icon(CupertinoIcons.xmark_circle),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
