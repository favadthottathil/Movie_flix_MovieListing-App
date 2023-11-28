import 'package:flutter/material.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing.dart';
import 'package:movie_flix_app/view/TopRated/top_rated.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final screen = [
    const NowPlaying(),
    const TopRated()
  ];
}
