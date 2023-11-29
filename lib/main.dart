import 'package:flutter/material.dart';
import 'package:movie_flix_app/navigation_menu.dart';
import 'package:movie_flix_app/provider/navigation_bar_provider.dart';
import 'package:movie_flix_app/provider/refresh_provider_now_playing.dart';
import 'package:movie_flix_app/provider/refresh_provider_top_rated.dart';
import 'package:movie_flix_app/provider/search_provider_now_playing.dart';
import 'package:movie_flix_app/provider/search_provider_top_rated.dart';
import 'package:movie_flix_app/view/Detail_Screen/Nowplaying/details_screen_now_playing.dart';
import 'package:movie_flix_app/view/Detail_Screen/TopRated/details_screen_top_rated.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/Search_Movies/Nowplaying/search_movies_nowplaying.dart';
import 'package:movie_flix_app/view/Search_Movies/TopRated/search_movies_top_rated.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {

    // Use for initializing provider.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider<SearchProviderNowPlaying>(create: (_) => SearchProviderNowPlaying()),
        ChangeNotifierProvider<SearchProviderNowPlaying>(create: (_) => SearchProviderNowPlaying()),
        ChangeNotifierProvider<SearchProviderTopRated>(create: (_) => SearchProviderTopRated()),
        ChangeNotifierProvider<RefreshProviderNowPlaying>(create: (_) => RefreshProviderNowPlaying()),
        ChangeNotifierProvider<RefreshProviderTopRated>(create: (_) =>RefreshProviderTopRated())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor, // Set primary color for the app.
        ),
        initialRoute: '/', // Set the initial route when app starts.

        // List of Screens.
        routes: {
          '/': (context) => const NavigationMenu(),
          'nowplaying': (context) => const NowPlaying(),
          '/detailsPageNowplaying': (context) => const DetailsScreenNowPlaying(),
          '/detailspageTopRated' : (context) => const DetailsScreenTopRated(),
          '/searchmoviesNowPlayed': (context) => const SearchMoviesNowPlaying(),
          '/searchmoviesTopRated': (context) => const SearchMoviesTopRated(),
        },
      ),
    );
  }
}
