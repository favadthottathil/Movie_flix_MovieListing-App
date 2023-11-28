import 'package:flutter/material.dart';
import 'package:movie_flix_app/Model/now_playing.dart';

class SearchProvider extends ChangeNotifier {
  List<NowPlayingModel> _filteredMovies = [];

  List<NowPlayingModel> get filteredMovies => _filteredMovies;

  filterMovies(String searchText, List<NowPlayingModel> movies) {
    _filteredMovies = movies.where((movie) => movie.title.toLowerCase() == searchText.toLowerCase()).toList();
    notifyListeners();
  }
}
