import 'package:flutter/material.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:movie_flix_app/view/Home/home_widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      // appBar: AppBar(),
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}
