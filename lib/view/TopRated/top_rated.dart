import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_flix_app/Api/top_rated_api.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing_widgets.dart';
import 'package:movie_flix_app/view/TopRated/top_rated_widgets.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder(
        future: TopRatedApi().getDataFromTopRatedApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
              final moviesData = snapshot.data!;

              return SafeArea(child: makeBodyofTopRated(context,moviesData));
            } else if (snapshot.hasError) {
              log(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator(strokeWidth: 2));
          // return SafeArea(child: makeBody(context));
        }
      ),
    );
  }
}
