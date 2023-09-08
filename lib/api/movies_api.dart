import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../model/cast_model_class.dart';
import '../model/model_class.dart';

class ApiServices {
  String trending = '/trending/movie/day';
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {"api_key": "20a3049cd0a3c31a7cca08eb22d4d157"}));
  Future<MovieModel?> getposts() async {
    try {
      Response response = await dio.get(trending);
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("Error Code : $e");
    }
    return null;
  }

  Future<CastModel?> getcastposts(int movieid) async {
    String castPath = '/movie/$movieid/credits';
    try {
      Response response = await dio.get(castPath);
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return castModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("Error Code : $e");
    }
    return null;
  }

  Future<MovieModel?> getTrndingWeek() async {
    String trendingWeek = '/trending/movie/day';
    try {
      Response response = await dio.get(trendingWeek);
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("Error Code : $e");
    }
    return null;
  }

  Future<MovieModel?> getTopRated() async {
    String topRated = '/movie/top_rated';
    try {
      Response response = await dio.get(topRated);
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("Error Code : $e");
    }
    return null;
  }

  Future<MovieModel?> searchmovie(String movie) async {
    String topRated = '/search/movie';
    try {
      Response response =
          await dio.get(topRated, queryParameters: {"query": movie});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("Error Code : $e");
    }
    return null;
  }
}
