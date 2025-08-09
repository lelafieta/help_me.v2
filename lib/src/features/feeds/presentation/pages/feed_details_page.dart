import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:utueji/core/gen/assets.gen.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/images/app_images.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/image_helper.dart';
import '../../domain/entities/feed_entity.dart';

class FeedDetailsPage extends StatelessWidget {
  final FeedEntity feed;
  const FeedDetailsPage({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text("Detalhes do Feed")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.black12,
                            child: CachedNetworkImage(
                              imageUrl: ImageHelper.buildImageUrl(
                                feed.ong!.profileImageUrl!,
                              ),
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        title: Text("${feed.ong!.name}"),
                        subtitle: Text(
                          AppDateUtilsHelper.formatDate(
                            data: feed.createdAt!,
                            showTime: true,
                          ),
                        ),
                        trailing: const Icon(Icons.more_vert),
                      ),
                      Text("${feed.description}"),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: CachedNetworkImage(
                                  imageUrl: ImageHelper.buildImageUrl(
                                    feed.image!,
                                  ),
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.heartBold,
                                    color: Colors.red,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${feed.likes.length}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.commentAlt,
                                    color: Colors.black,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${feed.comments.length}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.eye,
                                    color: Colors.black,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${feed.views.length}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            Assets.icons.paperPlane,
                            color: Colors.black,
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Text("Comentários (${feed.comments.length})"),
            Divider(),
            ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final comment = feed.comments[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  minVerticalPadding: 5,
                  minLeadingWidth: 5,
                  horizontalTitleGap: 10,
                  titleAlignment: ListTileTitleAlignment.titleHeight,
                  minTileHeight: 10,
                  leading: (comment.user.avatarUrl != null)
                      ? ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: comment.user.avatarUrl.toString(),
                            fit: BoxFit.cover,
                            width: 45,
                            height: 45,
                            progressIndicatorBuilder:
                                (context, url, progress) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 45,
                            height: 45,
                            color: Colors.black12,
                            child: Image.asset(AppImages.me),
                          ),
                        ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${comment.user.firstName} ${comment.user.lastName}",
                      ),

                      Text(
                        AppDateUtilsHelper.formatDate(
                          data: comment.createdAt,
                          showTime: true,
                        ),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),

                    child: Text(
                      comment.description,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  // trailing: SizedBox(
                  //   width: 80,
                  //   child: Column(
                  //     children: [
                  //       const Text("12:06m"),
                  //       const SizedBox(height: 5),
                  //       Container(
                  //         width: 20,
                  //         height: 20,
                  //         decoration: BoxDecoration(
                  //           color: Colors.black,
                  //           borderRadius: BorderRadius.circular(50),
                  //         ),
                  //         child: const Center(
                  //           child: Text(
                  //             "9",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15);
              },
              itemCount: feed.comments.length,
            ),
          ],
        ),
      ),
    );
  }
}
