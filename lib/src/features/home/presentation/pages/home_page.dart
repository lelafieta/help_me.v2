import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:utueji/core/gen/assets.gen.dart';

import 'package:utueji/src/features/events/presentation/widgets/event_skeleton_widget.dart';
import 'package:utueji/src/features/home/presentation/cubit/home_campaign_cubit/home_campaign_cubit.dart';
import 'package:utueji/src/features/ongs/presentation/widgets/ong_skeleton_widget.dart';
import 'package:utueji/src/features/solidary/cubit/user_local_data/user_local_data_cubit.dart';

import '../../../../app/di.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/cache/secure_storage.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/resources/images/app_images.dart';
import '../../../../core/services/i_telemetry_service.dart';
import '../../../campaigns/presentation/widgets/campaign_skeleton_widget.dart';
import '../../../campaigns/presentation/widgets/campaign_widget.dart';
import '../../../categories/presentation/cubit/category_cubit.dart';
import '../../../events/presentation/cubit/event_cubit.dart';
import '../../../events/presentation/cubit/event_state.dart';
import '../../../events/presentation/widgets/event_widget.dart';
import '../../../favorites/presentation/cubit/favorite_cubit.dart';
import '../../../ongs/presentation/cubit/ong_cubit.dart';
import '../../../ongs/presentation/cubit/ong_state.dart';
import '../../../ongs/presentation/widgets/ong_widget.dart';
import '../../../solidary/cubit/solidary_cubit.dart';
import '../cubit/home_campaign_cubit/home_campaign_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SecureCacheHelper secureCacheHelper = SecureCacheHelper();
  final telemetry = sl<ITelemetryService>();
  String fullName = "";
  String avatarUrl = "";
  @override
  void initState() {
    super.initState();
    telemetry.setCurrentScreen(screenName: "HomePage");
    // getUserData();
    // context.read<FavoriteCubit>().getAllFavorites();
    context.read<HomeCampaignCubit>().getLatestUrgentCampaigns();
    context.read<EventCubit>().getNearbyEvents();
    context.read<OngCubit>().getLatestOngs();
    context.read<CategoryCubit>().getAllCategories();
  }

  final List<Map<String, dynamic>> colorPairs = [
    {
      'background': const Color.fromRGBO(
        255,
        59,
        48,
        0.12,
      ), // vermelho claro opaco
      'color': const Color(0xFFFF3B30), // vermelho suave vivo
      'icon': Assets.icons.medicineBottleOne,
    },
    {
      'background': const Color.fromRGBO(10, 132, 255, 0.12), // azul opaco
      'color': const Color(0xFF0A84FF), // azul suave vivo
      'icon': Assets.icons.oldMan,
    },
    {
      'background': const Color.fromRGBO(255, 214, 10, 0.12), // amarelo opaco
      'color': Colors.orange, // amarelo suave
      'icon': Assets.icons.education,
    },
    {
      'background': const Color.fromRGBO(48, 209, 88, 0.12), // verde opaco
      'color': const Color(0xFF30D158), // verde suave vivo
      'icon': Assets.icons.group,
    },
    {
      'background': const Color.fromRGBO(191, 90, 242, 0.12), // roxo opaco
      'color': const Color(0xFFBF5AF2), // roxo vivo suave
      'icon': Assets.icons.animalShelter,
    },
    {
      'background': const Color.fromRGBO(
        255,
        69,
        58,
        0.12,
      ), // rosa avermelhado opaco
      'color': const Color(0xFFFF453A), // rosa avermelhado suave
      'icon': Assets.icons.alert,
    },
    {
      'background': const Color.fromRGBO(
        100,
        210,
        255,
        0.12,
      ), // azul claro opaco
      'color': const Color(0xFF64D2FF), // azul claro vivo
      'icon': Assets.icons.handHoldingHeart,
    },
    {
      'background': const Color.fromRGBO(255, 179, 64, 0.12), // laranja opaco
      'color': const Color(0xFFFFB340), // laranja suave
      'icon': Assets.icons.handHoldingHeart,
    },
  ];

  Future<void> getUserData() async {
    secureCacheHelper.getData(key: "fullName").then((value) {
      setState(() {
        fullName = value!;
      });
    });
    secureCacheHelper.getData(key: "avatarUrl").then((value) {
      setState(() {
        avatarUrl = value!;
      });
    });
  }

  String formatarDataPersonalizada(DateTime data) {
    String diaSemana = DateFormat.EEEE('pt_BR').format(data); // Sábado
    String dia = DateFormat.d().format(data); // 11
    String mes = DateFormat.MMMM('pt_BR').format(data); // Abril
    String horaMinuto = DateFormat('HH:mm').format(data); // 10:35

    return '$diaSemana, $dia $mes $horaMinuto';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SolidaryCubit, SolidaryState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: BlocBuilder<UserLocalDataCubit, UserLocalDataState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        (state is UserLocalDataLoaded)
                            ? Text(
                                "Olá! ${state.firstName} ${state.lastName}",
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            : Text("Olá! Ajuda-me"),
                        const SizedBox(width: 5),
                        Image.asset(AppImages.wave, width: 16),
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Text(
                  "Sua mudança torna algumas vidas melhores",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(color: Colors.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Pesquise campanhas, caridades...",
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        AppIcons.search,
                        width: 14,
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        AppIcons.microphone,
                        width: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150.0,
                    enableInfiniteScroll: false,
                    padEnds: false,
                    viewportFraction: 0.93,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue, AppColors.primaryColor],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "JUNTOS",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "PODEMOS",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "OFEREÇA\nO SEU TEMPO",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    "Trabalho em equipe faz o sonho funcionar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(AppImages.child),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 90,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    print(state);
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return Center(child: Text(state.error));
                    } else if (state is CategoryLoaded) {
                      final categories = state.categories;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.categoryCampaignsRoute,
                                arguments: categories[index],
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color:
                                        ((colorPairs[index %
                                                    colorPairs
                                                        .length]['background'])
                                                as Color)
                                            .withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    colorPairs[index %
                                        colorPairs.length]['icon'],
                                    width: 12,
                                    color:
                                        ((colorPairs[index %
                                                colorPairs.length]['color'])
                                            as Color),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(categories[index].name.toString()),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: categories.length,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Necessidades Urgentes",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.campaignUrgentsRoute);
                      },
                      child: Text("Ver mais"),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeCampaignCubit, HomeCampaignState>(
                builder: (context, state) {
                  if (state is HomeCampaignLoading) {
                    return HomeCampaignSkeletonWidget();
                  } else if (state is HomeCampaignError) {
                    return Text("${state.message}");
                  } else if (state is HomeCampaignLoaded) {
                    if (state.campaigns.isEmpty) {
                      return const Center(child: Text("Sem campanhas"));
                    }

                    return CarouselSlider.builder(
                      itemCount: state.campaigns.length,
                      itemBuilder:
                          (
                            BuildContext context,
                            int itemIndex,
                            int pageViewIndex,
                          ) {
                            final camapaign = state.campaigns[itemIndex];
                            return CampaignWidget(campaign: camapaign);
                          },
                      options: CarouselOptions(
                        height: 350,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.95,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        animateToClosest: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  }
                  return Text("ERRRO ${state}");
                },
              ),

              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Próximos Eventos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(onPressed: () {}, child: Text("Ver mais")),
                  ],
                ),
              ),
              BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {
                  if (state is EventLoading) {
                    return CarouselSlider.builder(
                      itemCount: 8,
                      itemBuilder:
                          (
                            BuildContext context,
                            int itemIndex,
                            int pageViewIndex,
                          ) {
                            return const EventSkeletonWidget();
                          },
                      options: CarouselOptions(
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.95,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        animateToClosest: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (state is EventLoaded) {
                    if (state.events.isEmpty) {
                      return Center(child: Text("Sem eventos registados"));
                    } else {
                      final events = state.events;
                      return CarouselSlider(
                        options: CarouselOptions(
                          height: 308,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.95,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          animateToClosest: false,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: events.map((event) {
                          return EventWidget(event: event);
                        }).toList(),
                      );
                    }
                  }
                  return Text("data");
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ONG's Populares",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(onPressed: () {}, child: Text("Ver mais")),
                  ],
                ),
              ),

              BlocBuilder<OngCubit, OngState>(
                builder: (context, state) {
                  if (state is OngLoading) {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 165,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        animateToClosest: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (context, index, pageViewIndex) {
                        return const OngSkeletonWidget();
                      },
                      itemCount: 8,
                    );
                  } else if (state is OngLoaded) {
                    if (state.ongs.isEmpty) {
                      return const Center(child: Text("Sem ongs registadas"));
                    }
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        animateToClosest: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: state.ongs.map((ong) {
                        return OngWidget(ong: ong);
                      }).toList(),
                    );
                  }
                  return Text("data");
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}

class HomeCampaignSkeletonWidget extends StatelessWidget {
  const HomeCampaignSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return const CampaignSkeletonWidget();
      },
      options: CarouselOptions(
        height: 420,
        aspectRatio: 16 / 9,
        viewportFraction: 0.95,
        initialPage: 0,
        enableInfiniteScroll: false,
        animateToClosest: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
