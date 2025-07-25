import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../app/app_entity.dart';
import '../../config/themes/app_colors.dart';
import '../../features/campaigns/domain/entities/campaign_contributor_entity.dart';
import '../../features/campaigns/presentation/cubit/campaign_store_favorite_cubit/campaign_store_favorite_cubit.dart';
import '../../features/favorites/domain/entities/favorite_entity.dart';
import '../../features/favorites/presentation/cubit/favorite_cubit.dart';
import '../../features/favorites/presentation/cubit/favorite_state.dart';
import '../../gen/assets.gen.dart';
import 'app_date_utils_helper.dart';

class AppUtils {
  static String formatCurrency(num value) {
    return "AOA ${NumberFormat.compact(locale: 'pt_AO').format(value)}";
  }

  static String formatNumber(num value) {
    return NumberFormat.compact(locale: 'pt').format(value);
  }

  static int daysBetweenToday(DateTime date) {
    DateTime today = DateTime.now();
    return date.difference(today).inDays;
  }

  static String formatFullCurrency(num value) {
    return NumberFormat.currency(locale: 'pt_AO', symbol: "AOA").format(value);
  }

  

  /// Retorna quantos dias já se passaram desde a data até hoje (sempre positivo)
  // static int daysSinceDate(DateTime date) {
  //   DateTime today = DateTime.now();
  //   return today.difference(date).inDays.abs();
  // }

  static double calculateFundraisingPercentage(
    double? fundsRaised,
    double? fundraisingGoal,
  ) {
    if (fundsRaised == null ||
        fundraisingGoal == null ||
        fundraisingGoal == 0) {
      return 0.0;
    }

    double percentage = (fundsRaised / fundraisingGoal) * 100;
    return double.parse(percentage.toStringAsFixed(2));
  }

  static String formatDate({
    required DateTime data,
    bool showWeekday = false,
    bool showDay = true,
    bool showMonth = true,
    bool abbreviatedMonth = true, // Novo parâmetro para abreviar o mês
    bool showYear = true,
    bool showTime = false,
  }) {
    List<String> parts = [];

    if (showWeekday) {
      parts.add(
        DateFormat.EEEE('pt_BR').format(data).capitalize!,
      ); // Exemplo: Sábado
    }
    if (showDay) {
      parts.add(DateFormat.d().format(data)); // Exemplo: 11
    }
    if (showMonth) {
      String monthFormat = abbreviatedMonth ? 'MMM' : 'MMMM';
      parts.add(
        DateFormat(monthFormat, 'pt_BR').format(data),
      ); // Exemplo: Abr ou Abril
    }
    if (showYear) {
      parts.add(DateFormat('yyyy').format(data)); // Exemplo: 2025
    }

    String dateString = parts.join(' de '); // Monta a data

    if (showTime) {
      String timeString = DateFormat('HH:mm').format(data); // Exemplo: 10:35
      return '$dateString | $timeString';
    }

    return dateString;
  }

  /// Retorna a diferença em dias entre hoje e a data fornecida (pode ser negativo se a data for no passado)
  static int daysRemainingUntil(DateTime targetDate) {
    DateTime today = DateTime.now();

    // Normaliza as datas para garantir a contagem exata de dias
    DateTime normalizedTarget = DateTime(
      targetDate.year,
      targetDate.month,
      targetDate.day,
    );
    DateTime normalizedToday = DateTime(today.year, today.month, today.day);

    return normalizedTarget.difference(normalizedToday).inDays;
  }

  /// Retorna quantos dias já se passaram desde a data até hoje (sempre positivo)
  static String daysSinceDate(DateTime dateSince, DateTime dateUntil) {
    // Normaliza as datas para meia-noite para garantir que os dias sejam contados corretamente
    DateTime normalizedSince = DateTime(
      dateSince.year,
      dateSince.month,
      dateSince.day,
    );
    DateTime normalizedUntil = DateTime(
      dateUntil.year,
      dateUntil.month,
      dateUntil.day,
    );

    return normalizedUntil.difference(normalizedSince).inDays.toString();
  }

  /// Retorna quantos dias faltam para a data (zero ou positivo, sem valores negativos)
  static int daysElapsedSince(DateTime startDate) {
    DateTime today = DateTime.now();

    // Normaliza as datas para meia-noite (00:00:00)
    DateTime normalizedStart = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    DateTime normalizedToday = DateTime(today.year, today.month, today.day);

    return normalizedToday.difference(normalizedStart).inDays;
  }

  static Positioned contributeUserItem(
    double left,
    double top,
    double bottom,
    String? imagePath,
    Color color, {
    String? text,
  }) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: (text != null) ? 30 : 16,
          height: 16,
          color: color,
          child: (text == null)
              ? (imagePath == null)
                    ? SizedBox.shrink()
                    : CachedNetworkImage(
                        imageUrl: imagePath,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
              : Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  static void contributorUsers(
    BuildContext context,
    List<CampaignContributorEntity> contributors,
  ) {
    showStickyFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      isSafeArea: true,
      headerHeight: 50,
      bottomSheetColor: Theme.of(context).scaffoldBackgroundColor,
      bottomSheetBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      context: context,
      headerBuilder: (BuildContext context, double offset) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ), // Bordas arredondadas no topo
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            "[${contributors.length}] Doadores",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
      bodyBuilder: (BuildContext context, double offset) {
        return SliverChildBuilderDelegate((BuildContext context, int index) {
          final contributor = contributors[index];
          if (contributor.isAnonymous) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(width: 40, height: 40, color: Colors.black12),
              ),
              title: Text("Anónimo"),
              subtitle: Text(
                AppDateUtilsHelper.formatDate(
                  data: contributor.createdAt,
                  showTime: true,
                ),
                style: TextStyle(fontSize: 12),
              ),
              trailing: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(
                    context,
                  ).style.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: AppUtils.formatCurrency(
                        double.parse(contributor.money.toString()),
                      ),
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 40,
                height: 40,
                child: CachedNetworkImage(
                  imageUrl: contributor.user.avatarUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            title: Text(contributor.user.fullName),
            subtitle: Text(
              AppDateUtilsHelper.formatDate(
                data: contributor.createdAt,
                showTime: true,
              ),
              style: TextStyle(fontSize: 12),
            ),
            trailing: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: AppUtils.formatCurrency(
                      double.parse(contributor.money.toString()),
                    ),
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          );
        }, childCount: contributors.length);
      },
      anchors: [0, 0.5, 1],
    );
  }

  static Positioned contributeUserDescription(
    double left,
    double top,
    double bottom,
    String? imagePath,
    Color color, {
    String? text,
  }) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 16,
          color: color,
          child: (text == null)
              ? (imagePath == null)
                    ? SizedBox.shrink()
                    : CachedNetworkImage(
                        imageUrl: imagePath,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
              : Center(
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
        ),
      ),
    );
  }

  static Widget contributores(
    List<CampaignContributorEntity>? campaignContributors,
  ) {
    if (campaignContributors == null || campaignContributors.isEmpty) {
      return Expanded(
        child: SizedBox(
          height: 16,
          child: Stack(
            children: [
              AppUtils.contributeUserItem(
                0,
                0,
                0,
                null,
                AppColors.primaryColor,
                text: "0",
              ),
              AppUtils.contributeUserDescription(
                40,
                0,
                0,
                null,
                Colors.transparent,
                text: "Nenhuma Pessoa",
              ),
            ],
          ),
        ),
      );
    } else if (campaignContributors.length == 1) {
      return Expanded(
        child: SizedBox(
          height: 16,
          child: Stack(
            children: [
              AppUtils.contributeUserItem(
                0,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                Colors.black,
              ),
              AppUtils.contributeUserItem(
                8,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                AppColors.primaryColor,
                text: "1",
              ),
              AppUtils.contributeUserDescription(
                45,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                Colors.transparent,
                text: "Contributo",
              ),
            ],
          ),
        ),
      );
    } else if (campaignContributors.length == 2) {
      return Expanded(
        child: SizedBox(
          height: 16,
          child: Stack(
            children: [
              AppUtils.contributeUserItem(
                0,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                Colors.transparent,
              ),
              AppUtils.contributeUserItem(
                8,
                0,
                0,
                campaignContributors[1].user.avatarUrl,
                Colors.transparent,
              ),
              AppUtils.contributeUserItem(
                16,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                AppColors.primaryColor,
                text: "2",
              ),
              AppUtils.contributeUserDescription(
                50,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                Colors.transparent,
                text: "Contributos",
              ),
            ],
          ),
        ),
      );
    } else if (campaignContributors.length == 3) {
      return Expanded(
        child: SizedBox(
          height: 16,
          child: Stack(
            children: [
              AppUtils.contributeUserItem(
                0,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                Colors.black,
              ),
              AppUtils.contributeUserItem(
                8,
                0,
                0,
                campaignContributors[1].user.avatarUrl,
                Colors.red,
              ),
              AppUtils.contributeUserItem(
                16,
                0,
                0,
                campaignContributors[2].user.avatarUrl,
                Colors.green,
              ),
              AppUtils.contributeUserItem(
                24,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                AppColors.primaryColor,
                text: "3",
              ),
              AppUtils.contributeUserDescription(
                55,
                0,
                0,
                campaignContributors[0].user.avatarUrl,
                Colors.transparent,
                text: "Contributos",
              ),
            ],
          ),
        ),
      );
    }
    return Expanded(
      child: SizedBox(
        height: 16,
        child: Stack(
          children: [
            AppUtils.contributeUserItem(
              0,
              0,
              0,
              campaignContributors[0].user.avatarUrl,
              Colors.black,
            ),
            AppUtils.contributeUserItem(
              8,
              0,
              0,
              campaignContributors[0].user.avatarUrl,
              Colors.red,
            ),
            AppUtils.contributeUserItem(
              16,
              0,
              0,
              campaignContributors[0].user.avatarUrl,
              Colors.green,
            ),
            AppUtils.contributeUserItem(
              24,
              0,
              0,
              campaignContributors[0].user.avatarUrl,
              AppColors.primaryColor,
              text: "+${campaignContributors.length - 3}",
            ),
            AppUtils.contributeUserDescription(
              60,
              0,
              0,
              campaignContributors[0].user.avatarUrl,
              Colors.transparent,
              text: "Contributos",
            ),
          ],
        ),
      ),
    );
  }

  static Widget favoriteWidget({
    required BuildContext context,
    required int itemId,
    required String itemType,
  }) {
    ValueNotifier<bool> isMyFavorite = ValueNotifier<bool>(false);
    return Container(
      child:
          BlocConsumer<CampaignStoreFavoriteCubit, CampaignStoreFavoriteState>(
            listener: (context, state) {
              if (state == CampaignStoreFavoriteState.success) {
                context.read<FavoriteCubit>().getAllFavorites();
              }
            },
            builder: (context, stateStore) {
              return BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.icons.heartBold.path,
                        width: 25,
                        color: Colors.white,
                      ),
                    );
                  } else if (state is FavoriteLoaded) {
                    bool isFavorite = state.favorites.any(
                      (element) => element.itemId == itemId,
                    );
                    isMyFavorite.value = isFavorite;

                    return ValueListenableBuilder(
                      valueListenable: isMyFavorite,
                      builder: (context, value, _) {
                        return RoundCheckBox(
                          uncheckedColor: Colors.transparent,
                          checkedColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          isChecked: value,
                          checkedWidget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              width: 25,
                              Assets.icons.heartBold.path,
                              color: Colors.red,
                            ),
                          ),
                          uncheckedWidget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              width: 25,
                              Assets.icons.heartBold.path,
                            ),
                          ),
                          onTap: (selected) {
                            isMyFavorite.value = selected!;
                            // setState(() {
                            //   isMyFavorite = isMyFavorite;

                            if (selected) {
                              context
                                  .read<CampaignStoreFavoriteCubit>()
                                  .addFavorite(
                                    FavoriteEntity(
                                      itemId: itemId,
                                      userId: AppEntity.uid,
                                      itemType: itemType,
                                    ),
                                  );
                            } else {
                              context
                                  .read<CampaignStoreFavoriteCubit>()
                                  .removeFavorite(
                                    FavoriteEntity(
                                      itemId: itemId,
                                      userId: AppEntity.uid,
                                      itemType: itemType,
                                    ),
                                  );
                            }
                          },
                        );
                      },
                    );
                  }
                  return Text("DATA");
                },
              );
            },
          ),
    );
  }
}
