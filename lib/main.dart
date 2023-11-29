import 'package:flutter/material.dart';
import 'package:movie_flix_app/navigation_menu.dart';
import 'package:movie_flix_app/provider/navigation_bar_provider.dart';
import 'package:movie_flix_app/provider/search_provider.dart';
import 'package:movie_flix_app/view/Detail_Screen/details_screen.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/Search_Movies/search_movies.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const NavigationMenu(),
          'nowplaying': (context) => const NowPlaying(),
          '/detailsPage': (context) => const DetailsScreenNowPlaying(),
          '/searchmovies': (context) => const SearchMovies(),
        },
      ),
    );
  }
}
