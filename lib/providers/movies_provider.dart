import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'cd8faef5c9b47fd260a88b5671d77162';
  String _baseUrl = 'api.themoviedb.org';
  String _lang = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('movies provider inicialized');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'lang': _lang, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    // print(nowPlayingResponse.results[1].title);
    // print(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
