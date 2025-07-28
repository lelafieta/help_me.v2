import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:utueji/src/config/routes/app_routes.dart';
import 'package:utueji/src/features/home/presentation/pages/home_page.dart';
import 'package:utueji/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:utueji/src/features/solidary/cubit/user_local_data/user_local_data_cubit.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/resources/images/app_images.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../../campaigns/presentation/pages/my_campaign_page.dart';
import '../../../categories/presentation/cubit/category_cubit.dart';
import '../../../chat/presentation/pages/chat_page.dart';
import '../../../explore/presentation/pages/explore_page.dart';
import '../../../home/presentation/cubit/home_profile_data_cubit/home_profile_data_cubit.dart';
import '../../../profile/presentation/cubit/count_donation_cubit/count_donation_cubit.dart';
import '../../cubit/solidary_cubit.dart';

class SolidaryPage extends StatefulWidget {
  final int? currentIndex;
  const SolidaryPage({super.key, this.currentIndex});

  @override
  State<SolidaryPage> createState() => _SolidaryPageState();
}

class _SolidaryPageState extends State<SolidaryPage> {
  int _currentIndex = 0;

  final List<String> iconPaths = [
    AppIcons.houseChimney,
    AppIcons.compassAlt,
    AppIcons.heartPartnerHandshake,
    AppIcons.comments,
  ];

  final List<String> iconPathsBold = [
    AppIcons.houseChimneyBold,
    AppIcons.compassAltBold,
    AppIcons.heartPartnerHandshakeBold,
    AppIcons.commentsBold,
  ];

  final List<MenuItem> menuItems = [
    MenuItem(
      title: "Home",
      iconPath: AppIcons.houseChimney,
      activeIconPath: AppIcons.houseChimneyBold,
      isActive: true,
    ),
    MenuItem(
      title: "Nvegador",
      iconPath: AppIcons.compassAlt,
      activeIconPath: AppIcons.compassAltBold,
    ),
    MenuItem(
      title: "Campanhas",
      iconPath: AppIcons.heartPartnerHandshake,
      activeIconPath: AppIcons.heartPartnerHandshakeBold,
    ),
    MenuItem(
      title: "Chat",
      iconPath: AppIcons.comments,
      activeIconPath: AppIcons.commentsBold,
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
    if (widget.currentIndex != null) {
      _currentIndex = widget.currentIndex!;
    }
    context.read<CountDonationCubit>().counter();
    context.read<ProfileCubit>().getProfile();
    // context.read<CategoryCubit>().getAllCategories();
    super.initState();

    // context.read<SolidaryCubit>()..getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: [
          (_currentIndex == 0)
              ? BlocBuilder<SolidaryCubit, SolidaryState>(
                  builder: (context, state) {
                    return SafeArea(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: SvgPicture.asset(Assets.icons.menu),
                        ),
                        trailing: SizedBox(
                          width: 150,

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // IconButton(
                              //   onPressed: () {
                              //     Get.toNamed(AppRoutes.favoriteRoute);
                              //   },
                              //   icon: SvgPicture.asset(
                              //     AppIcons.heart,
                              //     color: Colors.black87,
                              //   ),
                              // ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.favoriteRoute);
                                },
                                icon: SvgPicture.asset(
                                  Assets.icons.notificationBellOutline,
                                  color: Colors.black87,
                                  width: 28,
                                ),
                              ),

                              BlocBuilder<
                                UserLocalDataCubit,
                                UserLocalDataState
                              >(
                                builder: (context, state) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.profileRoute);
                                    },
                                    child: (state is UserLocalDataLoaded)
                                        ? (state.avatarUrl!.isEmpty)
                                              ? Image.asset(AppImages.avatar)
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                    left: 16,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(
                                                          state.avatarUrl!,
                                                        ),
                                                  ),
                                                )
                                        : SizedBox.shrink(),
                                  );
                                },
                              ),
                              SizedBox(width: 16),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : SizedBox.shrink(),
          Expanded(
            child: BlocBuilder<SolidaryCubit, SolidaryState>(
              builder: (context, state) {
                return BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    EasyLoading.dismiss();
                    if (state is AuthLoading) {
                      EasyLoading.show(status: "Processando...");
                    } else if (state is AuthFailure) {
                      EasyLoading.show(status: "${state.failure}");
                    } else if (state is AuthSignedOut) {
                      Get.toNamed(AppRoutes.loginRoute);
                    }
                  },
                  child: pages[_currentIndex],
                );
              },
            ),
          ),
        ],
      ),
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

Widget _buildDrawerItem(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, color: Colors.teal),
    title: Text(title),
    onTap: () {
      // ação ao clicar
    },
  );
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header
          Container(
            height: 200,
            color: AppColors.primaryColor,
            child: DrawerHeader(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0,
                    leading: ClipOval(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(
                      "Lela Fieta",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    subtitle: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.location,
                          width: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Luanda, Angola, Morro Bento",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  Assets.icons.play,
                  "Ver como usar a plataforma",
                ),
                _buildDrawerItem(
                  Assets.icons.rewardedAdsOutlinerounded,
                  "	Recompensas",
                ),
                _buildDrawerItem(Assets.icons.readerOutline, "Sobre nós"),
                _buildDrawerItem(Assets.icons.language, "Idioma"),
                _buildDrawerItem(
                  Assets.icons.liveHelpoutline,
                  "Central de ajuda",
                ),
                _buildDrawerItem(
                  Assets.icons.addFriendsFilled,
                  "Convidar amigos",
                ),
                _buildDrawerItem(Assets.icons.note04, "	Termos e condições"),
              ],
            ),
          ),

          // Logout at bottom
          SafeArea(
            child: ListTile(
              leading: SvgPicture.asset(
                Assets.icons.signOut,
                color: AppColors.primaryColor,
                width: 22,
              ),
              horizontalTitleGap: 5,
              title: Text(
                "Sair",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                // ação de logout
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String icon, String title) {
    return ListTile(
      leading: SvgPicture.asset(icon, color: AppColors.primaryColor, width: 22),
      horizontalTitleGap: 5,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        // ação ao clicar
      },
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
