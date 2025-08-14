import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/image_helper.dart';
import '../../domain/entities/post_entity.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.post});

  final PostEntity post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  List<String> imageUrls = [];

  @override
  void initState() {
    imageUrls = widget.post.resources.map((el) => el.url).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.postDetailsRoute, arguments: widget.post);
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
                  child: ImageHelper.showImage(widget.post.user!.avatarUrl),
                ),
                title: Text("${widget.post.user!.fullName}"),
                subtitle: Text(
                  AppDateUtilsHelper.formatDate(
                    data: widget.post.createdAt,
                    showTime: true,
                  ),
                ),
                trailing: const Icon(Icons.more_vert),
              ),
              // Text("${widget.post.content}"),
              ReadMoreText(
                widget.post.content.toString(),
                trimMode: TrimMode.Line,
                trimLines: 5,
                colorClickableText: Colors.red,
                trimCollapsedText: ' Mostrar mais',
                trimExpandedText: ' Mostrar menos',
                moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(8),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     height: 200,
                    //     child: ImageHelper.showImage(post.imageUrl),
                    //   ),
                    // ),

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
              PostImagesGrid(imageUrls: imageUrls, borderRadius: 12, gap: 4),
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
                            "${widget.post.likes.length}",
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
                            "${widget.post.comments.length}",
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
                            "${widget.post.views.length}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.paperPlane,
                        color: Colors.black,
                        width: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${widget.post.views.length}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
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

class PostImagesGrid extends StatelessWidget {
  const PostImagesGrid({
    super.key,
    required this.imageUrls,
    this.gap = 4.0,
    this.borderRadius = 10.0,
    this.maxHeight = 380.0,
  });

  final List<String> imageUrls;
  final double gap;
  final double borderRadius;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) return const SizedBox.shrink();

    final images = imageUrls.take(6).toList(); // limite de layout (opcional)
    final count = images.length;

    Widget child;

    if (count == 1) {
      child = _one(images[0]);
    } else if (count == 2) {
      child = _two(images);
    } else if (count == 3) {
      child = _three(images);
    } else {
      child = _fourOrMore(images, extra: imageUrls.length - 4);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: child,
      ),
    );
  }

  // ====== Layouts ======

  Widget _one(String url) {
    return _TappableImage(
      url: url,
      index: 0,
      all: imageUrls,
      fit: BoxFit.cover,
      heroTag: _heroTag(0),
    );
  }

  Widget _two(List<String> urls) {
    return Row(
      children: [
        Expanded(child: _cell(urls[0], 0, all: imageUrls)),
        SizedBox(width: gap),
        Expanded(child: _cell(urls[1], 1, all: imageUrls)),
      ],
    );
  }

  Widget _three(List<String> urls) {
    return Row(
      children: [
        Expanded(flex: 2, child: _cell(urls[0], 0, all: imageUrls)),
        SizedBox(width: gap),
        Expanded(
          child: Column(
            children: [
              Expanded(child: _cell(urls[1], 1, all: imageUrls)),
              SizedBox(height: gap),
              Expanded(child: _cell(urls[2], 2, all: imageUrls)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _fourOrMore(List<String> urls, {required int extra}) {
    // mostra no máximo 4 blocos; se houver mais, overlay "+N" na última célula
    final show = urls.take(4).toList();
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: _cell(show[0], 0, all: imageUrls)),
              SizedBox(width: gap),
              Expanded(child: _cell(show[1], 1, all: imageUrls)),
            ],
          ),
        ),
        SizedBox(height: gap),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _cell(show[2], 2, all: imageUrls)),
              SizedBox(width: gap),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _cell(show[3], 3, all: imageUrls),
                    if (extra > 0)
                      Positioned.fill(
                        child: InkWell(
                          onTap: () => _openViewer(3, imageUrls, navigatorKey),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.black.withOpacity(0.45),
                            child: Text(
                              '+$extra',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ====== Helpers ======

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  String _heroTag(int index) => 'post_img_${hashCode}_$index';

  Widget _cell(String url, int index, {required List<String> all}) {
    return _TappableImage(
      url: url,
      index: index,
      all: all,
      fit: BoxFit.cover,
      heroTag: _heroTag(index),
    );
  }

  static void _openViewer(
    int index,
    List<String> all,
    GlobalKey<NavigatorState> key,
  ) {
    final context = key.currentContext;
    if (context == null) return;
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withOpacity(0.95),
        pageBuilder: (_, __, ___) =>
            _FullScreenGallery(images: all, initialIndex: index),
      ),
    );
  }
}

// ========== Tappable image + hero ==========

class _TappableImage extends StatelessWidget {
  const _TappableImage({
    required this.url,
    required this.index,
    required this.all,
    required this.fit,
    required this.heroTag,
  });

  final String url;
  final int index;
  final List<String> all;
  final BoxFit fit;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          PostImagesGrid._openViewer(index, all, PostImagesGrid.navigatorKey),
      child: Hero(
        tag: heroTag,
        child: _SafeNetImage(url: url, fit: fit),
      ),
    );
  }
}

// ========== Network Image com fallback ==========

class _SafeNetImage extends StatelessWidget {
  const _SafeNetImage({required this.url, this.fit = BoxFit.cover});

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ImageHelper.showImage(
      url,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

// ========== Visualizador em tela cheia (zoom) ==========

class _FullScreenGallery extends StatefulWidget {
  const _FullScreenGallery({required this.images, required this.initialIndex});

  final List<String> images;
  final int initialIndex;

  @override
  State<_FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<_FullScreenGallery> {
  late final PageController _controller = PageController(
    initialPage: widget.initialIndex,
  );
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (_) => Navigator.of(context).maybePop(),
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) {
              return InteractiveViewer(
                minScale: 1.0,
                maxScale: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 'post_img_${widget.hashCode}_$i',
                    child: Image.network(
                      ImageHelper.buildImageUrl(widget.images[i]),
                      fit: BoxFit.contain,
                      loadingBuilder: (c, child, p) {
                        if (p == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (c, e, s) =>
                          const Icon(Icons.broken_image, size: 56),
                    ),
                  ),
                ),
              );
            },
          ),
          // topo: indicador + botão fechar
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            right: 8,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
                const Spacer(),
                _CounterBadge(current: _index + 1, total: widget.images.length),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterBadge extends StatelessWidget {
  const _CounterBadge({required this.current, required this.total});
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$current / $total',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
