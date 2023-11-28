import 'package:flutter/material.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarScreen({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text('Back', style: AppStyle.poppinsbold20),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: whiteColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
