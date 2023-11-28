import 'package:flutter/material.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/utils/icon_with_text.dart';
import 'package:sizer/sizer.dart';

// ignore: avoid_unnecessary_containers
final makeBottom = Container(
  // height: 70,
  child: const BottomAppBar(
    color: primaryColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconWithText(
          imagePath: 'Assets/clapperboard.png',
          text: 'Now Playing',
        ),
        IconWithText(
          imagePath: 'Assets/star.png',
          text: 'Top Rated',
        ),
      ],
    ),
  ),
);

final makeBody = ListView.builder(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  itemCount: 10,
  itemBuilder: (BuildContext context, int index) {
    return makeCard(context);
  },
);

makeCard(context) {
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
            Container(
              height: sizer.height * 0.2,
              width: 120,
              color: whiteColor,
            ),
            SizedBox(width: sizer.width * 0.02),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: sizer.width * 0.6,
                  child: Text(
                    'Movie Title',
                    style: AppStyle.poppinsbold25,
                  ),
                ),
                SizedBox(height: sizer.height * 0.04),
                SizedBox(
                  width: sizer.width * 0.6,
                  child: Text(
                    'descritpionfhkhakfajhfdjashfadadfhfdhjdfafdakjdjhdajajk',
                    // style: AppStyle.poppinsbold10,
                    // overflow: TextOverflow.ellipsis,
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

// final makeListTile = ListTile(
//     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     leading: ConstrainedBox(
//       constraints: BoxConstraints(
//         minWidth: 50,
//         minHeight: 100,
//       ),
//       child: Container(
//         // width: 50,
//         // height: 200,
//         color: whiteColor,
//       ),
//     ),
//     title: Text(
//       "Introduction to Driving",
//       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//     ),
//     trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
