import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model_class.dart';

class UpcomingApiservices {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {"api_key": "20a3049cd0a3c31a7cca08eb22d4d157"}));
  Future<MovieModel?> upcomingGetposts() async {
    String upcomingpath = '/movie/upcoming';
    try {
      Response response = await dio.get(upcomingpath);
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on Exception catch (e) {
      log('Error code : $e');
    }
    return null;
  }
}

final upcomingApiservices = Provider((ref) => UpcomingApiservices());
final upcomgetposts =
    FutureProvider((ref) => ref.read(upcomingApiservices).upcomingGetposts());
