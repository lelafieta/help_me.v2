import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:utueji/src/config/routes/app_routes.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/resources/images/app_images.dart';
import '../../../../core/utils/app_utils.dart';
import '../../domain/entities/ong_entity.dart';

class OngWidget extends StatefulWidget {
  final OngEntity ong;
  const OngWidget({super.key, required this.ong});

  @override
  State<OngWidget> createState() => _OngWidgetState();
}

class _OngWidgetState extends State<OngWidget> {
  List<Map<String, dynamic>> list = [];
  String textForMore = "membros";

  @override
  void initState() {
    list = widget.ong.ongMember!.map((toElement) {
      Map<String, dynamic> item = {};
      item["user"] = toElement.user;
      return item;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.ongProfileRoute, arguments: widget.ong);
      },
      child: Container(
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                titleAlignment: ListTileTitleAlignment.center,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (widget.ong.profileImageUrl == null)
                      ? Image.asset(AppImages.coverBackground)
                      : CachedNetworkImage(
                          imageUrl: widget.ong.profileImageUrl!,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                ),
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${widget.ong.name}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      width: 16,
                      AppIcons.shieldTrust,
                      color: AppColors.blueColor,
                    ),
                  ],
                ),
                subtitle: Text(
                  "${widget.ong.bio}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     padding: const EdgeInsets.all(10),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Divider(color: Colors.grey.shade400, height: 2),
            //         Row(
            //           children: [
            //             Expanded(
            //               child: SizedBox(
            //                 height: 16,
            //                 child: Stack(
            //                   children: [
            //                     AppUtils.contributeUserItem(
            //                       0,
            //                       0,
            //                       0,
            //                       null,
            //                       Colors.grey,
            //                     ),
            //                     AppUtils.contributeUserItem(
            //                       8,
            //                       0,
            //                       0,
            //                       null,
            //                       Colors.grey.shade600,
            //                     ),
            //                     AppUtils.contributeUserItem(
            //                       16,
            //                       0,
            //                       0,
            //                       null,
            //                       Colors.grey.shade700,
            //                     ),
            //                     AppUtils.contributeUserItem(
            //                       24,
            //                       0,
            //                       0,
            //                       null,
            //                       Colors.grey.shade800,
            //                       text: "+16",
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            // const Icon(Icons.add, color: AppColors.primaryColor),
            // const Text(
            //   "Juntar-se",
            //   style: TextStyle(color: AppColors.primaryColor),
            // ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Divider(),
            Container(
              // color: Colors.amber,
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: AppUtils.memberParticipatesWidget(
                            list: list,
                            textForMore: textForMore,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.add, color: AppColors.primaryColor),
                  const Text(
                    "Juntar-se",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
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
