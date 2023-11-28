import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_flix_app/Model/now_playing.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/utils/format_date.dart';
import 'package:movie_flix_app/utils/url_const.dart';
import 'package:movie_flix_app/view/Detail_Screen/details_screen_widget.dart';

class DetailsScreenNowPlaying extends StatelessWidget {
  const DetailsScreenNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    final movieData = ModalRoute.of(context)?.settings.arguments as NowPlayingModel;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const AppBarScreen(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage('$backdropPosterUrl${movieData.backdropPath}'),
          fit: BoxFit.cover,
        )),
        child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 4)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: size.height * 0.6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        color: Colors.black54,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movieData.title, style: AppStyle.poppinsbold15),
                              const SizedBox(height: 25),
                              Text(
                                formateDate(movieData.releaseDate),
                                style: AppStyle.poppinsbold14,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('Assets/crown.svg', color: whiteColor),
                                        const SizedBox(width: 10),
                                        Text('46%', style: AppStyle.poppins14),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.alarm, color: whiteColor),
                                  const SizedBox(width: 10),
                                  Text('2 hr 36 mins', style: AppStyle.poppins14),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                movieData.overview,
                                style: AppStyle.poppinsbold14,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator(strokeWidth: 2));
              }
            }),
      ),
    );
  }
}
