import 'package:flutter/material.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing.dart';
import 'package:movie_flix_app/view/TopRated/top_rated.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  
  // Getter to access the current selected index.
  int get selectedIndex => _selectedIndex;
  
  // Setter to update selected index.
  set changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  
  // List of Screens.
  final screen = [
    const NowPlaying(),
    const TopRated()
  ];
}
