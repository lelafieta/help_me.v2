import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/image_helper.dart';
import '../../../posts/presentation/cubit/community_post/community_post_cubit.dart';
import '../../../posts/presentation/cubit/post_cubit.dart';
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
    context.read<CommunityPostCubit>().getPostsByCommunityId(
      widget.community.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Comunidade'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.writeF, width: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.userAdd2Fill),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.communityDetailsRoute,
                arguments: widget.community,
              );
            },
            icon: SvgPicture.asset(Assets.icons.settingsAccountBoxSharp),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquise por uma palavra chave",
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
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => {
                context.read<CommunityPostCubit>().getPostsByCommunityId(
                  widget.community.id,
                ),
              },
              child: BlocBuilder<CommunityPostCubit, CommunityPostState>(
                builder: (context, state) {
                  if (state is CommunityPostLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CommunityPostFailure) {
                    return Center(child: Text(state.failure));
                  } else if (state is CommunityPostLoaded) {
                    final posts = state.posts;
                    return ListView.separated(
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
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
                                          "post",
                                        ),
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (
                                              context,
                                              url,
                                              downloadProgress,
                                            ) => SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
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

                                // AppUtils.buildHashtagText(
                                //   post.content.toString(),
                                //   context,
                                // ),
                                Text(post.content.toString()),
                                // const SizedBox(height: 10),
                                (post.resources.isNotEmpty)
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  FullscreenExtendedGallery(
                                                    imageUrls: post.resources
                                                        .map((r) => r.url)
                                                        .toList(),
                                                  ),
                                            ),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: ExtendedImage.network(
                                            ImageHelper.buildImageUrl(
                                              post.resources[0].url,
                                            ),
                                            fit: BoxFit.cover,
                                            cache: true,
                                            height: 200,
                                            width: double.infinity,
                                            loadStateChanged: (state) {
                                              if (state
                                                      .extendedImageLoadState ==
                                                  LoadState.loading) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else if (state
                                                      .extendedImageLoadState ==
                                                  LoadState.failed) {
                                                return const Icon(Icons.error);
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
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
            ),
          ),
        ],
      ),
    );
  }
}

class FullscreenExtendedGallery extends StatelessWidget {
  final List<String> imageUrls;

  const FullscreenExtendedGallery({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ExtendedImageGesturePageView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return ExtendedImage.network(
                ImageHelper.buildImageUrl(imageUrls[index]),
                fit: BoxFit.contain,
                mode: ExtendedImageMode.gesture,
                cache: true,
                initGestureConfigHandler: (state) => GestureConfig(
                  minScale: 1.0,
                  maxScale: 3.0,
                  animationMinScale: 0.8,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: true,
                  initialAlignment: InitialAlignment.center,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
