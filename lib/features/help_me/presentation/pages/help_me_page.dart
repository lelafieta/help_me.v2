import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:help_me/config/themes/app_colors.dart';
import 'package:help_me/features/campaigns/presentation/pages/my_campaign_page.dart';
import 'package:help_me/features/chat/presentation/pages/chat_page.dart';
import 'package:help_me/features/explore/presentation/pages/explore_page.dart';
import 'package:help_me/features/home/presentation/pages/home_page.dart';
import 'package:help_me/gen/assets.gen.dart';

import '../../../../core/strings/app_strings.dart';

class HelpMePage extends StatefulWidget {
  const HelpMePage({super.key});

  @override
  State<HelpMePage> createState() => _HelpMePageState();
}

class _HelpMePageState extends State<HelpMePage> {
  int _currentIndex = 0;
  final List<String> iconPaths = [
    Assets.svg.home.path,
    Assets.svg.explorer.path,
    Assets.svg.campaign.path,
    Assets.svg.chat.path,
  ];
  final List<String> iconPathsBold = [
    Assets.svg.homeFilled.path,
    Assets.svg.explorerFilled.path,
    Assets.svg.campaignFilled.path,
    Assets.svg.chatFilled.path,
  ];
  final List<MenuItem> menuItems = [
    MenuItem(
      title: "Home",
      iconPath: Assets.svg.home.path,
      activeIconPath: Assets.svg.homeFilled.path,
      isActive: true,
    ),
    MenuItem(
      title: "Navegador",
      iconPath: Assets.svg.explorer.path,
      activeIconPath: Assets.svg.explorerFilled.path,
    ),
    MenuItem(
      title: "Campanhas",
      iconPath: Assets.svg.campaign.path,
      activeIconPath: Assets.svg.campaignFilled.path,
    ),
    MenuItem(
      title: "Chat",
      iconPath: Assets.svg.chat.path,
      activeIconPath: Assets.svg.chatFilled.path,
    ),
  ];
  final List<Widget> pages = [
    const HomePage(),
    const ExplorePage(),
    const MyCampaignPage(),
    const ChatPage(),
  ];
  Map<String, dynamic>? arguments = Get.arguments;

  @override
  void initState() {
    super.initState();
    // context.read<CountDonationCubit>()..counter();
    // context.read<ProfileCubit>()..getProfile();
    // context.read<SolidaryCubit>()..getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: buttomNavigationBar(),
    );
  }

  AnimatedBottomNavigationBar buttomNavigationBar() {
    return AnimatedBottomNavigationBar.builder(
      itemCount: menuItems.length,
      tabBuilder: (int index, bool isActive) {
        final menuItem = menuItems[index]; // Obtém o item do menu atual
        final color = isActive ? AppColors.primaryColor : Colors.grey;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              menuItem.currentIconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 4), // Espaçamento entre ícone e texto
            Text(
              menuItem.title,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontFamily: AppStrings.fontFamily,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        );
      },
      activeIndex: _currentIndex,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) => setState(() {
        _currentIndex = index;
        for (int i = 0; i < menuItems.length; i++) {
          menuItems[i] = menuItems[i].copyWith(isActive: i == index);
        }
      }),
    );
  }
}

class MenuItem {
  final String title;
  final String iconPath;
  final String activeIconPath;
  final bool isActive;
  final Color color;

  MenuItem({
    required this.title,
    required this.iconPath,
    required this.activeIconPath,
    this.isActive = false,
    this.color = Colors.grey,
  });

  String get currentIconPath => isActive ? activeIconPath : iconPath;

  MenuItem copyWith({bool? isActive, Color? color}) {
    return MenuItem(
      title: title,
      iconPath: iconPath,
      activeIconPath: activeIconPath,
      isActive: isActive ?? this.isActive,
      color: color ?? this.color,
    );
  }
}
