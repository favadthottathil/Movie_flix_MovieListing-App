import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_flix_app/Api/now_playing_api.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing_widgets.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // Setting background color.
      body: FutureBuilder(
        // Fetching data from API using FutureBuilder.
        future: NowPlayingApi().getDataFromNowPlayingApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Extract movies data and build the UI.
            final moviesData = snapshot.data!;

            return SafeArea(child: makeBodyofNowPlaying(context, moviesData));
          } else if (snapshot.hasError) {
            // Pring Error.
            log(snapshot.error.toString());
          }

          // Display a loading while fetching Data
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        },
      ),
    );
  }
}
