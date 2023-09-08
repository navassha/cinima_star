import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/movies_api.dart';
import '../model/cast_model_class.dart';
import '../model/model_class.dart';

final apiservices = Provider((ref) => ApiServices());
final getpostsprovider =
    FutureProvider((ref) => ref.read(apiservices).getposts());

final getCastPosts = FutureProvider.family<CastModel?, int>((ref, movieId) {
  return ref.read(apiservices).getcastposts(movieId);
});

final getTrendingweek =
    FutureProvider((ref) => ref.read(apiservices).getTrndingWeek());

final topRatedMovies =
    FutureProvider((ref) => ref.read(apiservices).getTopRated());

// final searchmovie = FutureProvider.family<MovieModel?, String>((ref, movieId) {
//   return ref.read(apiservices).searchmovie(movieId);
// });

final movienameProvider = StateProvider<String>((ref) {
  return "";
});

final searchProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.watch(apiservices).searchmovie(ref.watch(movienameProvider));
});
