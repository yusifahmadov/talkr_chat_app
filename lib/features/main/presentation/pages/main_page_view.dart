import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talkr_chat_app/core/constant/constants.dart';

class MainPageView extends StatefulWidget {
  const MainPageView(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
          bottomNavigationBar: _bottomNavigationBar(), body: widget.body),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          widget.onDestinationSelected(index);
        },
        backgroundColor: blackBackgroundAccentColor,
        currentIndex: widget.selectedIndex,
        elevation: 0,
        showSelectedLabels: true,
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, color: Color(0xff6E6E6E)),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: Colors.red,
        ),
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 25,
              height: 25,
              color: const Color(0xffFFFFFF),
            ),
            label: 'Əsas',
            icon: SvgPicture.asset(
              "assets/icons/home-outline.svg",
              width: 25,
              height: 25,
              color: const Color(0xff6E6E6E),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            activeIcon: SvgPicture.asset(
              "assets/icons/person.svg",
              width: 25,
              height: 25,
              color: const Color(0xffFFFFFF),
            ),
            icon: SvgPicture.asset(
              "assets/icons/person-outline.svg",
              width: 25,
              color: const Color(0xff6E6E6E),
              height: 25,
            ),
          )
        ]);
  }
}
