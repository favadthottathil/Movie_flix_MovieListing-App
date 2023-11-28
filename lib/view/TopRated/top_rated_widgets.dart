import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_flix_app/Model/top_rated.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/utils/url_const.dart';

makeBodyofTopRated(BuildContext context, List<TopRatedModel> moviesData, {bool showSearch = true}) {
  final size = MediaQuery.of(context).size;

  return Column(
    children: [
      if (showSearch)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/searchmovies'),
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.search_normal,
                    color: whiteColor,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Search Movies',
                    style: AppStyle.poppins14,
                  )
                ],
              ),
            ),
          ),
        ),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: moviesData.length,
          itemBuilder: (BuildContext context, int index) {
            final movies = moviesData[index];

            return makeCard(context, movies);
          },
        ),
      ),
    ],
  );
}

makeCard(BuildContext context, TopRatedModel movies) {
  final sizer = MediaQuery.of(context).size;

  return InkWell(
    onTap: () => Navigator.pushNamed(context, '/detailsPage') // Navigate To Details Page

    ,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        color: listViewBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: sizer.height * 0.2,
              child: CachedNetworkImage(
                imageUrl: '$moviePosterUrl${movies.posterPath}',
                placeholder: (context, url) => const Center(
                  child: SpinKitCircle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(width: sizer.width * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: sizer.width * 0.6,
                  child: Text(
                    movies.title,
                    style: AppStyle.poppinsbold20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: sizer.height * 0.04),
                SizedBox(
                  width: sizer.width * 0.6,
                  child: Text(
                    movies.overview,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.poppinsbold14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
