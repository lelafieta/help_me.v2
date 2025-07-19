import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../app/app_entity.dart';
import '../../config/themes/app_colors.dart';
import '../../features/campaigns/presentation/cubit/campaign_store_favorite_cubit/campaign_store_favorite_cubit.dart';
import '../../features/favorites/domain/entities/favorite_entity.dart';
import '../../features/favorites/presentation/cubit/favorite_cubit.dart';
import '../../features/favorites/presentation/cubit/favorite_state.dart';
import '../../gen/assets.gen.dart';

class AppUtils {
  AppUtils._();

  static void errorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.error,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void successToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
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

  static String formatCurrency(num value) {
    return "AOA ${NumberFormat.compact(locale: 'pt_AO').format(value)}";
  }

  static String formatFullCurrency(num value) {
    return "${NumberFormat.currency(locale: 'pt_AO', symbol: "AOA").format(value)}";
  }

  static int daysBetweenToday(DateTime date) {
    DateTime today = DateTime.now();
    return date.difference(today).inDays;
  }

  /// Retorna quantos dias já se passaram desde a data até hoje (sempre positivo)
  static int daysSinceDate(DateTime date) {
    DateTime today = DateTime.now();
    return today.difference(date).inDays.abs();
  }
}
