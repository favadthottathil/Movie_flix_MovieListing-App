import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_flix_app/Api/top_rated_api.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/TopRated/top_rated_widgets.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // Set background color
      body: FutureBuilder(
          future: TopRatedApi().getDataFromTopRatedApi(), // Fetch data from API
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Get data from API
              final moviesData = snapshot.data!;

              return SafeArea(child: makeBodyofTopRated(context, moviesData)); // Build Top Rated UI.
            } else if (snapshot.hasError) {
              // show error
              log(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator(strokeWidth: 2));
            // return SafeArea(child: makeBody(context));
          }),
    );
  }
}
