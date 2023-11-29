import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_flix_app/provider/navigation_bar_provider.dart';
import 'package:movie_flix_app/utils/app_style.dart';
import 'package:movie_flix_app/utils/colors.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationBarProvider>(builder: (context, provider, child) {

        // Display the current screen based on the selected index.
        return provider.screen[provider.selectedIndex];
      }),
      bottomNavigationBar: Consumer<NavigationBarProvider>(
        builder: (context, provider, child) {

          // Configures the bottom navigation bar appearence and functionality.
          return NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStatePropertyAll(AppStyle.bottomNavBarColor),
            ),
            child: NavigationBar(
              backgroundColor: primaryColor,
              indicatorColor: Colors.amberAccent,
              height: 60,
              elevation: 0,
              selectedIndex: provider.selectedIndex,

              // Change the selected index when change tab.
              onDestinationSelected: (index) => provider.changeIndex = index,
              destinations: const [

                // Define Navigation Icon and Labels.
                NavigationDestination(
                  icon: Icon(Iconsax.clipboard),
                  label: 'Now Playing',
                ),
                NavigationDestination(
                  icon: Icon(Icons.star_border),
                  label: 'Top Rated',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
