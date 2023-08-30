import 'package:auto_route/auto_route.dart';
import 'package:busy_reader/features/books/presentation/screens/book_screen.dart';
import 'package:busy_reader/features/profile/presentation/screens/profile_screen.dart';
import 'package:busy_reader/res/assets/assets.gen.dart';
import 'package:busy_reader/res/assets/colors.gen.dart';
import 'package:busy_reader/theme/app_typography.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BookScreen(),
    Text(
      '',
    ),
    Text(
      '',
    ),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorName.blackApp,
        selectedLabelStyle: AppTypography.montserratMedium10,
        unselectedLabelStyle: AppTypography.montserratMedium10,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Assets.icons.homeTest.svg(color: ColorName.blackApp)
                : Assets.icons.home.svg(color: ColorName.lightGray),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.search.svg(
                color: _selectedIndex == 1
                    ? ColorName.blackApp
                    : ColorName.lightGray),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Assets.icons.heartFilled.svg(color: ColorName.blackApp)
                : Assets.icons.heart.svg(color: ColorName.lightGray),
            label: 'Избранные',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Assets.icons.profileTest.svg(color: ColorName.blackApp)
                : Assets.icons.profile.svg(color: ColorName.lightGray),
            label: 'Профиль',
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
