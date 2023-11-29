import 'package:flutter/material.dart';
import 'package:movie_flix_app/Api/now_playing_api.dart';
import 'package:movie_flix_app/Model/now_playing.dart';

class RefreshProviderNowPlaying extends ChangeNotifier {
  List<NowPlayingModel> _allMovies = [];

  List<NowPlayingModel> get allMovies => _allMovies;

  set setToallMovies(List<NowPlayingModel> movielist) {
    _allMovies = movielist;
  }

  Future<void> refresh() async {
    List<NowPlayingModel> files = await NowPlayingApi().getDataFromNowPlayingApi();

    _allMovies = files;
    notifyListeners();
  }

 set reomoveData(int index) {
    _allMovies.removeAt(index);
    notifyListeners();
  }
}
