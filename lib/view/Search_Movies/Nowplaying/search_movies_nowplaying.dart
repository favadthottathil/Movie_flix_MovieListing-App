import 'package:flutter/material.dart';
import 'package:movie_flix_app/Model/now_playing.dart';
import 'package:movie_flix_app/provider/search_provider_now_playing.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/Search_Movies/Nowplaying/now_playing_widgets.dart';
import 'package:provider/provider.dart';

class SearchMoviesNowPlaying extends StatelessWidget {
  const SearchMoviesNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    final movieData = ModalRoute.of(context)?.settings.arguments as List<NowPlayingModel>;

    Provider.of<SearchProviderNowPlaying>(context, listen: false).toFilteredMovies = movieData;

    return Consumer<SearchProviderNowPlaying>(builder: (context, provider, child) {
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
            style: AppStyle.poppins14,
            onChanged: (value) {
              // provier.filterMovies(value, movieData);
              provider.updateList(value, movieData);
            },
          ),
        ),
        body: makeBodyofNowPlayingSearch(context, provider.filteredMovies),
      );
    });
  }
}
