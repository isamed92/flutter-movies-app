import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('movies provider inicialized');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    String _apiKey = 'cd8faef5c9b47fd260a88b5671d77162';
    String _baseUrl = 'api.themoviedb.org';
    String _lang = 'es-ES';
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'lang': _lang, 'page': '1'});

    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);

    print(decodedData['dates']);
    // print(response.body);
  }
}
