import 'package:flutter/material.dart';
import 'package:movie_flix_app/Api/top_rated_api.dart';
import 'package:movie_flix_app/Model/top_rated.dart';

class RefreshProviderTopRated extends ChangeNotifier {
  List<TopRatedModel> _allMovies = [];

  List<TopRatedModel> get allMovies => _allMovies;

  set setToallMovies(List<TopRatedModel> movielist) {
    _allMovies = movielist;
  }

  Future<void> refresh() async {
    List<TopRatedModel> files = await TopRatedApi().getDataFromTopRatedApi();

    _allMovies = files;
    notifyListeners();
  }

  set reomoveData(int index) {
    _allMovies.removeAt(index);

    notifyListeners();
  }
}
