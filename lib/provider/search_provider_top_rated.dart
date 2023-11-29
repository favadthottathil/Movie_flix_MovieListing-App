import 'package:flutter/material.dart';
import 'package:movie_flix_app/Model/top_rated.dart';

class SearchProviderTopRated extends ChangeNotifier {
  List<TopRatedModel> _filteredMovies = [];

  List<TopRatedModel> get filteredMovies => _filteredMovies;

  set toFilteredMovies(List<TopRatedModel> movieData) {
    _filteredMovies = movieData;
  }

  void updateList(String value, List<TopRatedModel> moviedata) {
    _filteredMovies = moviedata
        .where(
          (element) => element.title.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    notifyListeners();
  }
}
