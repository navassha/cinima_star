import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_controllel.dart';
import '../utils/cinima_star_responsive.dart';
import '../view/cast_details.dart';
import 'package:shimmer/shimmer.dart';

class CastContainer extends ConsumerWidget {
  final int movieId;
  const CastContainer({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final castApi = ref.watch(getCastPosts(movieId));
    return castApi.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: ResMobSize.width(270, context),
          child: ListView.separated(
            itemCount: data.cast!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CastDetailsPage(
                      castdetails: data.cast![index],
                    ),
                  ),
                );
              },
              child: Container(
                height: ResMobSize.width(250, context),
                width: ResMobSize.width(150, context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
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
                      SizedBox(
                        width: ResMobSize.width(130, context),
                        height: ResMobSize.width(150, context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ResMobSize.width(10, context),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: data.cast![index].profilePath == null
                                ? "https://static-00.iconduck.com/assets.00/person-icon-1901x2048-a9h70k71.png"
                                : 'https://image.tmdb.org/t/p/w780${data.cast![index].profilePath}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                child: Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  highlightColor:
                                      const Color.fromARGB(255, 194, 194, 194),
                                  child: Container(
                                    height: ResMobSize.width(150, context),
                                    width: ResMobSize.width(130, context),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(
                                        ResMobSize.width(10, context),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(CupertinoIcons.xmark_circle),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: ResMobSize.width(136, context),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          data.cast![index].originalName!,
                          style: TextStyle(
                            fontSize: ResMobSize.width(15, context),
                            fontFamily: 'Poppins regular',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ResMobSize.width(136, context),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          data.cast![index].character!,
                          style: TextStyle(
                              fontSize: ResMobSize.width(12, context),
                              fontFamily: 'Poppins regular'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: ResMobSize.width(10, context),
            ),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Icon(CupertinoIcons.xmark_circle),
      ),
      loading: () => SizedBox(
        child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 255, 255, 255),
          highlightColor: const Color.fromARGB(255, 194, 194, 194),
          child: Container(
            height: ResMobSize.width(250, context),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                ResMobSize.width(10, context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
