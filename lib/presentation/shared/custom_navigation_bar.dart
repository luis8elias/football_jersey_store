import 'package:flutter/material.dart';
import '../../utils/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  final int index;
  final ValueChanged<int> onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _customIconButton(icon: 'search', innerIndex: 0),
              _customIconButton(icon: 'home'  , innerIndex: 1),
              _customIconButton(icon: 'heart' , innerIndex: 2),
            ],
          )
        ),
      ),
    );
  }

  IconButton _customIconButton({required icon, required innerIndex}) {

    const icons = {
      'search' : [SvgIcons.search, SvgIcons.searchBold],
      'home'   : [SvgIcons.home, SvgIcons.homeBold],
      'heart'  : [SvgIcons.heart, SvgIcons.hearthBold],
    };

    final iconsToUse = icons[icon];



    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: SvgPicture.asset(
           innerIndex == index ? iconsToUse![1] : iconsToUse![0],
          color: Colors.black,
          width: 25.0,
        ),
        onPressed: () => onIndexSelected(innerIndex));
  }
}