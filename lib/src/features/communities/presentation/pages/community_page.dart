import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utueji/src/features/posts/presentation/cubit/post_cubit.dart';

import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/image_helper.dart';
import '../../domain/entities/community_entity.dart';

class CommunityPage extends StatefulWidget {
  final CommunityEntity community;
  const CommunityPage({required this.community, super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  void initState() {
    context.read<PostCubit>().getPostsByCommunityId(widget.community.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostFailure) {
            return Center(child: Text(state.failure));
          } else if (state is PostLoaded) {
            final posts = state.posts;
            return ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final post = posts[index];
                return Container(
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
                                imageUrl: ImageHelper.buildImageUrl("post"),
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        SizedBox(
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
                          title: Text(
                            "${post.user.firstName} ${post.user.lastName}",
                          ),
                          subtitle: Text(
                            AppDateUtilsHelper.formatDate(
                              data: post.createdAt,
                              showTime: true,
                            ),
                          ),
                          trailing: const Icon(Icons.more_vert),
                        ),
                        Text(post.content.toString()),

                        // const SizedBox(height: 10),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(8),
                        //   child: Stack(
                        //     children: [
                        //       ClipRRect(
                        //         borderRadius: BorderRadius.circular(8),
                        //         child: SizedBox(
                        //           width: double.infinity,
                        //           height: 200,
                        //           child: CachedNetworkImage(
                        //             imageUrl: ImageHelper.buildImageUrl(
                        //               feed.image!,
                        //             ),
                        //             fit: BoxFit.cover,
                        //             progressIndicatorBuilder:
                        //                 (context, url, downloadProgress) =>
                        //                     SizedBox(
                        //                       width: 40,
                        //                       height: 40,
                        //                       child: CircularProgressIndicator(
                        //                         value:
                        //                             downloadProgress.progress,
                        //                       ),
                        //                     ),
                        //             errorWidget: (context, url, error) =>
                        //                 Icon(Icons.error),
                        //           ),
                        //         ),
                        //       ),
                        //       Positioned(
                        //         left: 0,
                        //         bottom: 0,
                        //         right: 0,
                        //         child: Container(
                        //           height: 45,
                        //           color: AppColors.primaryColor,
                        //           padding: const EdgeInsets.symmetric(
                        //             horizontal: 10,
                        //           ),
                        //           child: const Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Text(
                        //                 "Doar para sorrir",
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 12,
                        //                 ),
                        //               ),
                        //               Icon(
                        //                 Icons.arrow_forward_ios_rounded,
                        //                 size: 20,
                        //                 color: Colors.white,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             SvgPicture.asset(
                        //               AppIcons.heartBold,
                        //               color: Colors.red,
                        //               width: 16,
                        //             ),
                        //             const SizedBox(width: 5),
                        //             Text(
                        //               "${feed.likes.length}",
                        //               style: TextStyle(color: Colors.black),
                        //             ),
                        //           ],
                        //         ),
                        //         const SizedBox(width: 20),
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             SvgPicture.asset(
                        //               AppIcons.commentAlt,
                        //               color: Colors.black,
                        //               width: 16,
                        //             ),
                        //             const SizedBox(width: 5),
                        //             Text(
                        //               "${feed.comments.length}",
                        //               style: TextStyle(color: Colors.black),
                        //             ),
                        //           ],
                        //         ),
                        //         const SizedBox(width: 20),
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             SvgPicture.asset(
                        //               AppIcons.eye,
                        //               color: Colors.black,
                        //               width: 16,
                        //             ),
                        //             const SizedBox(width: 5),
                        //             Text(
                        //               "${feed.views.length}",
                        //               style: TextStyle(color: Colors.black),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //     SvgPicture.asset(
                        //       AppIcons.paperPlane,
                        //       color: Colors.black,
                        //       width: 16,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: posts.length,
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
