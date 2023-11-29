import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_flix_app/Model/top_rated.dart';
import 'package:movie_flix_app/provider/refresh_provider_top_rated.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/utils/url_const.dart';
import 'package:provider/provider.dart';

makeBodyofTopRated(BuildContext context, List<TopRatedModel> moviesData) {
  final size = MediaQuery.of(context).size;

  Provider.of<RefreshProviderTopRated>(context, listen: false).setToallMovies = moviesData;

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/searchmoviesTopRated', arguments: moviesData),
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
      Consumer<RefreshProviderTopRated>(builder: (context, provier, child) {
        return Expanded(
          child: RefreshIndicator(
            onRefresh: provier.refresh,
            child: SlidableAutoCloseBehavior(
              closeWhenOpened: true,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: provier.allMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movies = provier.allMovies[index];

                  return Slidable(
                    key: Key(movies.title),
                    endActionPane: ActionPane(
                      dismissible: DismissiblePane(onDismissed: () => provier.reomoveData = index),
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (context) => provier.reomoveData = index,
                        )
                      ],
                    ),
                    child: makeCard(context, movies),
                  );
                },
              ),
            ),
          ),
        );
      }),
    ],
  );
}

makeCard(BuildContext context, TopRatedModel movies) {
  final sizer = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/detailspageTopRated', arguments: movies) // Navigate To Details Page

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
