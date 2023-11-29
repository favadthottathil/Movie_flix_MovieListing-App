import 'package:flutter/material.dart';
import 'package:movie_flix_app/Model/now_playing.dart';

class SearchProvider extends ChangeNotifier {
  List<NowPlayingModel> _filteredMovies = [];

  List<NowPlayingModel> get filteredMovies => _filteredMovies;

  set toFilteredMovies(List<NowPlayingModel> movieData) {
    _filteredMovies = movieData;
  }

  void updateList(String value, List<NowPlayingModel> moviedata) {
    _filteredMovies = moviedata
        .where(
          (element) => element.title.toLowerCase().startsWith(value),
        )
        .toList();

    

    notifyListeners();
  }
}
