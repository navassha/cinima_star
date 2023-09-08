import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../services/api_controllel.dart';
import '../utils/cinima_star_responsive.dart';
import '../view/movie_details.dart';

class TopRatedMovies extends ConsumerWidget {
  const TopRatedMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topratedmovies = ref.watch(topRatedMovies);
    return topratedmovies.when(
      data: (data) {
        if (data == null) {
          const Center(
            child: Text("Somthing Went Wrong"),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          // scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemCount: data!.results!.length,
          itemBuilder: (context, index) => InkWell(
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
                  ResMobSize.width(5, context),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    // "https://wallpapercave.com/wp/wp7046960.jpg",
                    "https://image.tmdb.org/t/p/w500${data.results![index].backdropPath}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: ResMobSize.width(230, context),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResMobSize.width(5, context),
                  ),
                  color: const Color.fromARGB(161, 0, 187, 212),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    ResMobSize.width(10, context),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: ResMobSize.width(140, context),
                        height: ResMobSize.width(210, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ResMobSize.width(5, context),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${data.results![index].posterPath!}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ResMobSize.width(20, context),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: ResMobSize.width(165, context),
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              data.results![index]
                                  .title!, // Add movie name here
                              style: TextStyle(
                                fontSize: ResMobSize.width(17.5, context),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins regular",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                DateFormat("dd-MM-yyyy").format(data
                                    .results![index]
                                    .releaseDate!), // Add movie year and movie type
                                style: TextStyle(
                                  fontSize: ResMobSize.width(14, context),
                                  color: Colors.white,
                                  fontFamily: 'Poppins regular',
                                ),
                              ),
                              // Spacer(),
                              SizedBox(
                                width: ResMobSize.width(10, context),
                              ),
                              Container(
                                width: ResMobSize.width(60, context),
                                height: ResMobSize.width(30, context),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    ResMobSize.width(15, context),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.star_lefthalf_fill,
                                        size: ResMobSize.width(17, context),
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: ResMobSize.width(5, context),
                                      ),
                                      Text(
                                        data.results![index].voteAverage
                                            .toString(),
                                        style: TextStyle(
                                          fontSize:
                                              ResMobSize.width(12, context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins regular',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ResMobSize.width(15, context),
                          ),
                          SizedBox(
                            height: ResMobSize.width(15, context),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: ResMobSize.width(16, context),
                                backgroundColor: Colors.white,
                                child: Icon(
                                  CupertinoIcons.heart,
                                  size: ResMobSize.width(18, context),
                                  color: Colors.pink,
                                ),
                              ),
                              SizedBox(
                                width: ResMobSize.width(5, context),
                              ),
                              InkWell(
                                onTap: () async {
                                  Share.share(
                                      '${data.results![index].title} \n \n ${data.results![index].overview}\n \n The movie Popularity : ${data.results![index].popularity}',
                                      subject: 'Hy Wacth This Movie');
                                },
                                child: CircleAvatar(
                                  radius: ResMobSize.width(16, context),
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    CupertinoIcons.arrowshape_turn_up_right,
                                    size: ResMobSize.width(16, context),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ResMobSize.width(5, context),
                              ),
                              CircleAvatar(
                                radius: ResMobSize.width(16, context),
                                backgroundColor: Colors.white,
                                child: Icon(
                                  CupertinoIcons.square_arrow_down,
                                  size: ResMobSize.width(16, context),
                                  color: Colors.indigoAccent,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: ResMobSize.width(150, context),
                            height: ResMobSize.width(35, context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                ResMobSize.width(25, context),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Watch Now",
                                style: TextStyle(
                                  fontFamily: 'Poppins regular',
                                  fontSize: ResMobSize.width(16, context),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: ResMobSize.width(10, context),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Icon(CupertinoIcons.xmark_circle),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
