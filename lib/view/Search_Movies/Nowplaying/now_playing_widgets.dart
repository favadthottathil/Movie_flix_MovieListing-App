import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_flix_app/Model/now_playing.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/utils/url_const.dart';

makeBodyofNowPlayingSearch(BuildContext context, List<NowPlayingModel> moviesData) {
  // Provider.of<RefreshProviderNowPlaying>(context, listen: false).setToallMovies = moviesData;

  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: moviesData.length,
    itemBuilder: (BuildContext context, int index) {
      final movies = moviesData[index];

      return makeCard(context, movies);
    },
  );
}

makeCard(BuildContext context, NowPlayingModel movies) {
  final sizer = MediaQuery.of(context).size;

  return InkWell(
    onTap: () => Navigator.pushNamed(context, '/detailsPageNowplaying', arguments: movies) // Navigate To Details Page

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

class AppBarNowPlaying extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarNowPlaying({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
        ),
        // borderRadius: BorderRadius.circular(24),
      ),
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back_ios),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      // automaticallyImplyLeading: true,
    );
  }
}
