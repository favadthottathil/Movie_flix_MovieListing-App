import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_flix_app/Api/now_playing_api.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/NowPlaying/now_playing_widgets.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    // NowPlayingApi().getDataFromNowPlayingApi();
    // TopRatedApi().getDataFromTopRatedApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder(
          future: NowPlayingApi().getDataFromNowPlayingApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final moviesData = snapshot.data!;

              return SafeArea(child: makeBodyofNowPlaying(context,moviesData));
            } else if (snapshot.hasError) {
              log(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator(strokeWidth: 2));
          }),
    );
  }
}
