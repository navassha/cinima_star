import 'package:cinima_star/model/model_class.dart';
import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:cinima_star/widgets/movie_detail_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../services/dark_mode_provider.dart';
import '../widgets/cast_container.dart';
import '../widgets/movie_detils_blur_container.dart';

class MovieShowPage extends ConsumerWidget {
  final Result moviepage;

  const MovieShowPage({super.key, required this.moviepage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:
          ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ResMobSize.width(300, context),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                    ResMobSize.width(30, context),
                  ),
                  bottomLeft: Radius.circular(
                    ResMobSize.width(30, context),
                  ),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    moviepage.backdropPath != null
                        ? "https://image.tmdb.org/t/p/original${moviepage.backdropPath}"
                        : "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResMobSize.width(20, context),
                  vertical: ResMobSize.width(15, context),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(
                            ResMobSize.width(20, context),
                          ),
                          child: MoviePageBlurContainer(
                            icon: Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                              size: ResMobSize.width(20, context),
                            ),
                          ),
                        ),
                        const Spacer(),
                        MoviePageBlurContainer(
                          icon: Icon(
                            CupertinoIcons.tag,
                            color: Colors.white,
                            size: ResMobSize.width(20, context),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                ResMobSize.width(10, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: ResMobSize.width(200, context),
                        child: Text(
                          moviepage.title!,
                          style: TextStyle(
                            color: ref.watch(darkModeProvider) == false
                                ? Colors.black
                                : Colors.white,
                            fontSize: ResMobSize.width(26, context),
                            fontFamily: "Poppins regular",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: ResMobSize.width(70, context),
                        height: ResMobSize.width(35, context),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(
                            ResMobSize.width(15, context),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResMobSize.width(5, context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.white,
                                size: ResMobSize.width(15, context),
                              ),
                              Text(
                                moviepage.voteAverage!.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins regular',
                                  fontSize: ResMobSize.width(14, context),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResMobSize.width(20, context),
                  ),
                  Text(
                    "Overview",
                    style: TextStyle(
                      color: ref.watch(darkModeProvider) == false
                          ? Colors.black
                          : Colors.white,
                      fontFamily: 'Poppins regular',
                      fontSize: ResMobSize.width(18, context),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      moviepage.overview!,
                      style: TextStyle(
                        color: ref.watch(darkModeProvider) == false
                            ? Colors.black
                            : Colors.white,
                        fontFamily: 'Poppins regular',
                        fontSize: ResMobSize.width(14, context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResMobSize.width(20, context),
                  ),
                  Text(
                    "Release Date : ${DateFormat("dd-MM-yyyy").format(moviepage.releaseDate!)}",
                    style: TextStyle(
                      fontSize: ResMobSize.width(17, context),
                      color: ref.watch(darkModeProvider) == false
                          ? Colors.black
                          : Colors.white,
                      fontFamily: 'Poppins regular',
                    ),
                  ),
                  SizedBox(
                    height: ResMobSize.width(20, context),
                  ),
                  SizedBox(
                    width: ResMobSize.width(250, context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Share.share(
                                '${moviepage.title} \n \n ${moviepage.overview}\n \n The movie Popularity : ${moviepage.popularity}',
                                subject: 'Hy Wacth This Movie');
                          },
                          child: MovieDetailsButtons(
                            icon: Icon(
                              CupertinoIcons.arrowshape_turn_up_right,
                              size: ResMobSize.width(20, context),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        MovieDetailsButtons(
                          icon: Icon(
                            CupertinoIcons.heart,
                            size: ResMobSize.width(20, context),
                            color: Colors.white,
                          ),
                        ),
                        MovieDetailsButtons(
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            size: ResMobSize.width(20, context),
                            color: Colors.white,
                          ),
                        ),
                        MovieDetailsButtons(
                          icon: Icon(
                            CupertinoIcons.square_arrow_down,
                            size: ResMobSize.width(22, context),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResMobSize.width(20, context),
                  ),
                  Center(
                    child: Container(
                      width: ResMobSize.width(250, context),
                      height: ResMobSize.width(45, context),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(
                          ResMobSize.width(18, context),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Wacth Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins regular',
                            fontSize: ResMobSize.width(18, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResMobSize.width(20, context),
                  ),
                  Text(
                    "Cast",
                    style: TextStyle(
                      color: ref.watch(darkModeProvider) == false
                          ? Colors.black
                          : Colors.white,
                      fontSize: ResMobSize.width(18, context),
                      fontFamily: 'Poppins regular',
                    ),
                  ),
                  SizedBox(
                    height: ResMobSize.width(20, context),
                  ),
                  CastContainer(
                    movieId: moviepage.id!,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResMobSize.width(20, context),
            )
          ],
        ),
      ),
    );
  }
}
