import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:utueji/src/core/utils/image_helper.dart';
import 'package:utueji/src/features/feeds/domain/entities/feed_entity.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../communities/presentation/pages/community_page.dart';
import '../../../posts/presentation/cubit/feed_post/feed_post_cubit.dart';
import '../../../posts/presentation/widgets/post_widget.dart';
import '../cubit/feed_cubit.dart';
import '../cubit/feed_state.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    // context.read<FeedCubit>().getFeeds();
    context.read<FeedPostCubit>().getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedPostCubit, FeedPostState>(
      builder: (context, state) {
        if (state is FeedPostLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FeedPostFailure) {
          return Center(child: Text(state.failure));
        } else if (state is FeedPostLoaded) {
          final posts = state.posts;
          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostWidget(post: post);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: posts.length,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class FeedWidget extends StatelessWidget {
  const FeedWidget({super.key, required this.feed});

  final FeedEntity feed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.postDetailsRoute, arguments: feed);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ImageHelper.showImage(feed.ong!.profileImageUrl),
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
                        child: ImageHelper.showImage(feed.image),
                      ),
                    ),

                    // Positioned(
                    //   left: 0,
                    //   bottom: 0,
                    //   right: 0,
                    //   child: Container(
                    //     height: 45,
                    //     color: AppColors.primaryColor,
                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                    //     child: const Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           "Doar para sorrir",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 12,
                    //           ),
                    //         ),
                    //         Icon(
                    //           Icons.arrow_forward_ios_rounded,
                    //           size: 20,
                    //           color: Colors.white,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                            AppIcons.heartBold,
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
                            AppIcons.commentAlt,
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
                            AppIcons.eye,
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
                    AppIcons.paperPlane,
                    color: Colors.black,
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
