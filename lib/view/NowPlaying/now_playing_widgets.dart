import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_flix_app/Model/now_playing.dart';
import 'package:movie_flix_app/provider/refresh_provider_now_playing.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/utils/icons_const.dart';
import 'package:movie_flix_app/utils/sizedboxes_const.dart';
import 'package:movie_flix_app/utils/url_const.dart';
import 'package:provider/provider.dart';

makeBodyofNowPlaying(BuildContext context, List<NowPlayingModel> moviesData) {
  final size = MediaQuery.of(context).size;

  // Updating Provider with fetched movie data
  Provider.of<RefreshProviderNowPlaying>(
    context,
    listen: false,
  ).setToallMovies = moviesData;

  return Column(
    children: [
      // Search Movies section
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            '/searchmoviesNowPlayed',
            arguments: moviesData,
          ),
          child: Container(
            width: size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: greyColor),
            ),
            child: Row(
              children: [
                // Search Icon
                searchIconWhite,

                // sized box width 20
                sizedbW20,
                Text(
                  'Search Movies',
                  style: AppStyle.poppins14,
                )
              ],
            ),
          ),
        ),
      ),

      // Display Movies
      Consumer<RefreshProviderNowPlaying>(
        builder: (context, provider, child) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: provider.refresh,
              child: SlidableAutoCloseBehavior(
                closeWhenOpened: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.allMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movies = provider.allMovies[index];

                    return Slidable(
                      key: Key(movies.title),
                      endActionPane: ActionPane(
                        dismissible: DismissiblePane(
                          onDismissed: () => provider.reomoveData = index,
                        ),
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (context) => provider.reomoveData = index,
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
        },
      ),
    ],
  );
}

makeCard(BuildContext context, NowPlayingModel movies) {
  final sizer = MediaQuery.of(context).size;

  return InkWell(
    onTap: () => Navigator.pushNamed(
      context,
      '/detailsPageNowplaying',
      arguments: movies,
    ) // Navigate To Details Page

    ,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        color: listViewBackground, // Background of the Card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: sizer.height * 0.2,
              child: CachedNetworkImage(
                imageUrl: '$moviePosterUrl${movies.posterPath}', // Loading movie poster
                placeholder: (context, url) => const Center(
                  child: SpinKitCircle(color: Colors.black), // plce while fetching data
                ),
              ),
            ),
            sizedbW10, // Sizedbox Width 10
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedbH10, // Sizedbox Height 10
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
