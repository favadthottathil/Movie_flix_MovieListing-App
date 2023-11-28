import 'package:flutter/material.dart';
import 'package:movie_flix_app/view/Detail_Screen/details_screen_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarScreen(),
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                color: Colors.black45,
                height: size.height * 0.5,
                width: size.width * 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
