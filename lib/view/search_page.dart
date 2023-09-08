import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinima_star/services/dark_mode_provider.dart';
import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../model/model_class.dart';
import '../services/api_controllel.dart';
import 'movie_details.dart';

class CinimaStarSearch extends ConsumerWidget {
  CinimaStarSearch({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref.watch(searchProvider);
    return Scaffold(
      backgroundColor:
          ref.watch(darkModeProvider) == false ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: !ref.watch(darkModeProvider)
                        ? Colors.transparent
                        : Colors.white,
                    borderRadius: BorderRadius.circular(
                      ResMobSize.width(16, context),
                    ),
                  ),
                  width: ResMobSize.width(200, context),
                  height: ResMobSize.width(45, context),
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      ref.read(movienameProvider.notifier).state = value;
                      ref.invalidate(searchProvider);
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: ResMobSize.width(10, context),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          ResMobSize.width(16, context),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          ResMobSize.width(16, context),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(
                          ResMobSize.width(5, context),
                        ),
                        child: Container(
                          width: ResMobSize.width(40, context),
                          height: ResMobSize.width(40, context),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                              ResMobSize.width(16, context),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                              size: ResMobSize.width(20, context),
                            ),
                          ),
                        ),
                      ),
                      hintText: 'Search Movie',
                      hintStyle: TextStyle(
                        fontFamily: "Poppins regular",
                        fontSize: ResMobSize.width(15, context),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ResMobSize.width(20, context),
            ),
            SizedBox(
              height: ResMobSize.width(20, context),
            ),
            controller.text == ''
                ? Center(
                    child: Text(
                      "Search Movie Here!",
                      style: TextStyle(
                        color: ref.watch(darkModeProvider) == false
                            ? Colors.black
                            : Colors.white,
                        fontSize: ResMobSize.width(18, context),
                        fontFamily: 'Poppins regular',
                      ),
                    ),
                  )
                : item.when(
                    data: (data1) => searchLIST(data1, ref),
                    error: (error, stackTrace) => Text(
                      error.toString(),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            SizedBox(
              height: ResMobSize.width(120, context),
            ),
          ],
        ),
      ),
    );
  }

  ListView searchLIST(MovieModel? data, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
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
            image: const DecorationImage(
              image: AssetImage("asset/container_backgroud_image.jpg"),
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
              color: const Color(0x9F4AEAFF),
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
                    ),
                    child: data.results![index].posterPath != null
                        ? CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/w780${data.results![index].posterPath}",
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Icon(
                                CupertinoIcons.xmark_circle,
                                size: ResMobSize.width(20, context),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              "No Image Found",
                              style: TextStyle(
                                fontSize: ResMobSize.width(15, context),
                                fontFamily: 'Poppins regular',
                              ),
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
                        width: ResMobSize.width(164, context),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          data.results![index].title!, // Add movie name here
                          style: TextStyle(
                            fontSize: ResMobSize.width(17, context),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins regular",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ResMobSize.width(15, context),
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
                                data.results![index].voteAverage!
                                    .toInt()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: ResMobSize.width(12, context),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins regular',
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              await Share.share(
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
  }
}
