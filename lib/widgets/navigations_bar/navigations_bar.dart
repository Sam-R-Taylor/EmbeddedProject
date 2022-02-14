import 'package:flutter/material.dart';
import 'package:the_basics/widgets/navigations_bar/navigation_bar_tablet_desktop.dart';
import 'package:the_basics/widgets/navigations_bar/navigation_bar_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationsBar extends StatelessWidget {
  const NavigationsBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
