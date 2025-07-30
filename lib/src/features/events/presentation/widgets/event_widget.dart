import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:utueji/core/gen/assets.gen.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/image_helper.dart';
import '../../domain/entities/event_entity.dart';

class EventWidget extends StatefulWidget {
  final EventEntity event;
  const EventWidget({super.key, required this.event});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  List<Map<String, dynamic>> list = [];
  String textForMore = "membros";

  @override
  void initState() {
    // list = widget.event..map((toElement) {
    //   Map<String, dynamic> item = {};
    //   item["user"] = toElement.user;
    //   return item;
    // }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.eventDetail, arguments: widget.event);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 190,
                    child: CachedNetworkImage(
                      imageUrl: ImageHelper.buildImageUrl(
                        widget.event.backgroundImageUrl!,
                      ),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.blue.withOpacity(.4),
                            AppColors.primaryColor.withOpacity(.4),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 55,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.icons.calendar),
                          const SizedBox(width: 5),
                          Text(
                            AppDateUtilsHelper.formatDate(
                              data: widget.event.startDate!,
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: AppUtils.favoriteWidget(
                        context: context,
                        itemId: widget.event.id!,
                        itemType: "event",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.event.title!,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                // fontSize: 16,
                              ),

                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      // SvgPicture.asset(AppIcons.heartBold, color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded, size: 16),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "${widget.event.location}",
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 16,
                          child: Stack(
                            children: [
                              AppUtils.contributeUserItem(
                                0,
                                0,
                                0,
                                null,
                                Colors.black,
                              ),
                              AppUtils.contributeUserItem(
                                8,
                                0,
                                0,
                                null,
                                Colors.red,
                              ),
                              AppUtils.contributeUserItem(
                                16,
                                0,
                                0,
                                null,
                                Colors.green,
                              ),
                              AppUtils.contributeUserItem(
                                24,
                                0,
                                0,
                                null,
                                AppColors.primaryColor,
                                text: "+16",
                              ),
                              AppUtils.contributeUserDescription(
                                60,
                                0,
                                0,
                                null,
                                Colors.transparent,
                                text: "Participantes",
                              ),
                            ],
                          ),
                        ),
                      ),

                      Text("${widget.event.distanceKm!.toStringAsFixed(1)} km"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
