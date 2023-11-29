import 'package:flutter/material.dart';
import 'package:movie_flix_app/Model/top_rated.dart';
import 'package:movie_flix_app/provider/search_provider_top_rated.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing_widgets.dart';
import 'package:movie_flix_app/view/TopRated/top_rated_widgets.dart';
import 'package:provider/provider.dart';

class SearchMoviesTopRated extends StatefulWidget {
  const SearchMoviesTopRated({super.key});

  @override
  State<SearchMoviesTopRated> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMoviesTopRated> {
  List<TopRatedModel> filteredMovies = [];

  @override
  Widget build(BuildContext context) {
    final movieData = ModalRoute.of(context)?.settings.arguments as List<TopRatedModel>;

    Provider.of<SearchProviderTopRated>(context, listen: false).toFilteredMovies = movieData;

    filteredMovies = movieData;
    return Consumer<SearchProviderTopRated>(builder: (context, provider, child) {
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
        body: makeBodyofTopRated(context, provider.filteredMovies, showSearch: false),
        // body: SizedBox(),
      );
    });
  }
}
