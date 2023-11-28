import 'package:flutter/material.dart';
import 'package:movie_flix_app/Model/now_playing.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing_widgets.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  @override
  Widget build(BuildContext context) {
    final movieData = ModalRoute.of(context)?.settings.arguments as List<NowPlayingModel>;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: whiteColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search Movies',
            hintStyle: AppStyle.poppins14,
          ),
          autofocus: true,
        ),
      ),
      body: makeBodyofNowPlaying(context, movieData, showSearch: false),
      // body: SizedBox(),
    );
  }
}
