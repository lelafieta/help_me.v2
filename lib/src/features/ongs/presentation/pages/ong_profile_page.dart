import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/resources/images/app_images.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/image_helper.dart';
import '../../../campaigns/presentation/cubit/campaign_cubit.dart';
import '../../../campaigns/presentation/cubit/campaign_state.dart';
import '../../../campaigns/presentation/widgets/campaign_skeleton_widget.dart';
import '../../../campaigns/presentation/widgets/campaign_widget.dart';
import '../../../events/presentation/cubit/event_cubit.dart';
import '../../../events/presentation/cubit/event_state.dart';
import '../../../events/presentation/widgets/event_widget.dart';
import '../../../feeds/presentation/cubit/feed_cubit.dart';
import '../../../feeds/presentation/cubit/feed_state.dart';
import '../../domain/entities/ong_entity.dart';
import '../cubit/ong_cubit.dart';
import '../cubit/ong_state.dart';

class OngProfilePage extends StatefulWidget {
  final OngEntity ong;
  const OngProfilePage({super.key, required this.ong});

  @override
  State<OngProfilePage> createState() => _OngProfilePageState();
}

class _OngProfilePageState extends State<OngProfilePage> {
  ValueNotifier<Color> color = ValueNotifier(AppColors.whiteColor);
  List<String> menuList = ["Recentes", "Campanhas", "Eventos", "Blogs"];
  int selected = 0;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _topoKey = GlobalKey();

  ValueNotifier<bool> _showSticky = ValueNotifier(false);
  ValueNotifier<bool> _showStickyTopo = ValueNotifier(false);
  final GlobalKey _stickyKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkItem8Visibility);
  }

  void _checkItem8Visibility() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_stickyKey.currentContext == null) return;
        if (_topoKey.currentContext == null) return;

        final RenderBox box =
            _stickyKey.currentContext!.findRenderObject() as RenderBox;
        final RenderBox boxTopo =
            _topoKey.currentContext!.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero);
        final offsetTopo = boxTopo.localToGlobal(Offset.zero);

        final isNowSticky = offset.dy <= kToolbarHeight;
        final isNowStickyTopo = offsetTopo.dy <= kToolbarHeight;

        if (_showSticky != isNowSticky) {
          _showSticky.value = isNowSticky;
        }

        if (_showStickyTopo != isNowStickyTopo) {
          _showStickyTopo.value = isNowStickyTopo;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkItem8Visibility);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SliverSnap(
        onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
        collapsedBackgroundColor: Colors.black,
        expandedBackgroundColor: Colors.transparent,
        backdropWidget: Stack(
          children: [
            Image.asset(
              width: double.infinity,
              Assets.images.splash1.path,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(.8),
                      AppColors.primaryColor.withOpacity(.8),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),

        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              Assets.icons.aarrowLeftLg,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.icons.share,
                width: 22,
                color: Colors.black,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Container(height: 20),
          ),
        ),
        expandedContentHeight: 200,
        expandedContent: Container(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    child: (widget.ong.profileImageUrl != null)
                        ? ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: widget.ong.profileImageUrl!,

                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => ClipOval(
                                child: Image.asset(
                                  Assets.images.icon.path,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              Assets.images.icon.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
        collapsedContent: ClipOval(
          child: Container(width: 50, height: 50, color: Colors.green),
        ),

        body: Material(
          elevation: 7,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.ong.name}",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    width: 20,
                    AppIcons.shieldTrust,
                    color: AppColors.blueColor,
                  ),
                ],
              ),
              Center(child: Text(widget.ong.bio!)),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("1.000", style: TextStyle(color: Colors.black)),
                    SizedBox(width: 8),
                    Text("Suportes", style: TextStyle(color: Colors.black)),
                    SizedBox(width: 10),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("230", style: TextStyle(color: Colors.black)),
                    SizedBox(width: 8),
                    Text("Serviços", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade600),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            AppColors.whiteColor,
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.primaryColor,
                          ),
                          side: const MaterialStatePropertyAll(
                            BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Juntar-se",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.grey.shade300,
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            AppColors.blackColor,
                          ),
                          side: WidgetStateProperty.all(
                            BorderSide(color: Colors.grey.shade300, width: 1),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Chat",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.grey.shade300,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.blackColor,
                        ),
                        minimumSize: const WidgetStatePropertyAll(Size(50, 50)),
                        side: WidgetStatePropertyAll(
                          BorderSide(color: Colors.grey.shade300, width: 1),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.phone),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Sobre",
                  style: Theme.of(context).textTheme.titleMedium!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(widget.ong.about!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 16,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.lightbulbOn,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Visão",
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.ong.vision!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.bullseyeArrow,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Missão",
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.ong.mission!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Impactos feitos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(onPressed: () {}, child: Text("Ver mais")),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final impact = widget.ong.impacts![index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: ImageHelper.buildImageUrl(
                                impact.medias[0].mediaUrl,
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(color: Colors.black26),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 55,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      impact.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      AppDateUtilsHelper.formatDate(
                                        data: impact.date ?? DateTime.now(),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white70,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemCount: widget.ong.impacts!.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 50,
                          child: Stack(
                            children: [
                              Container(
                                // color: Colors.yellow,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.ong.coverImageUrl!,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                              ),
                                            ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.black26.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 16,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    width: 5,
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: widget.ong.profileImageUrl!,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: SafeArea(
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.share, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          widget.ong.name!,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          width: 16,
                          AppIcons.shieldTrust,
                          color: AppColors.blueColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    key: _topoKey,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(widget.ong.bio!),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text("1.000", style: TextStyle(color: Colors.black)),
                        SizedBox(width: 8),
                        Text("Suportes", style: TextStyle(color: Colors.black)),
                        SizedBox(width: 10),
                        Text(
                          "|",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("230", style: TextStyle(color: Colors.black)),
                        SizedBox(width: 8),
                        Text("Serviços", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                AppColors.whiteColor,
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor,
                              ),
                              side: const MaterialStatePropertyAll(
                                BorderSide(color: AppColors.primaryColor),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Juntar-se",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                AppColors.blackColor,
                              ),
                              side: const MaterialStatePropertyAll(
                                BorderSide(color: Colors.black12, width: 2),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Chat",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                              AppColors.blackColor,
                            ),
                            minimumSize: const MaterialStatePropertyAll(
                              Size(50, 50),
                            ),
                            side: const MaterialStatePropertyAll(
                              BorderSide(color: Colors.black12, width: 2),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.phone),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Sobre",
                      style: Theme.of(context).textTheme.titleMedium!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(widget.ong.about!),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: SvgPicture.asset(
                                      AppIcons.lightbulbOn,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Visão",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    widget.ong.vision!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: SvgPicture.asset(
                                      AppIcons.bullseyeArrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Missão",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    widget.ong.mission!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Impactos feitos",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(onPressed: () {}, child: Text("Ver mais")),
                      ],
                    ),
                  ),
                  BlocBuilder<OngCubit, OngState>(
                    builder: (context, state) {
                      if (state is OngLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is OngLoaded) {
                        if (state.ongs.isEmpty) {
                          return Center(child: Text("Sem ongs registadas"));
                        }
                        return SizedBox(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Image.asset(
                                        AppImages.image1,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Container(color: Colors.black26),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: 55,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black,
                                            ],
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Covid Test",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                "11 Agosto 2025",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                            itemCount: 15,
                          ),
                        );
                      }
                      return const Text("data");
                    },
                  ),
                  const SizedBox(height: 10),
                  // Container(
                  //   width: double.infinity,
                  //   height: 45,
                  //   decoration: BoxDecoration(),
                  // ),
                  Container(
                    key: _stickyKey,
                    width: double.infinity,

                    // height: 50,
                    // color: Colors.red,
                    child: TabBar(
                      isScrollable: true,
                      onTap: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.primaryColor,
                            width: 3,
                          ),
                        ),
                      ),
                      labelColor: AppColors.primaryColor,
                      unselectedLabelColor: Colors.black45,
                      indicatorColor: AppColors.primaryColor,
                      automaticIndicatorColorAdjustment: true,
                      tabs: [
                        Tab(
                          // icon:
                          //     Icon(Icons.access_time, color: AppColors.blackColor),
                          text: 'Recentes',
                        ),
                        Tab(
                          // icon: Icon(Icons.campaign, color: AppColors.blackColor),
                          text: 'Campanhas',
                        ),
                        Tab(
                          // icon: Icon(Icons.event, color: AppColors.blackColor),
                          text: 'Eventos',
                        ),
                        Tab(
                          // icon: Icon(Icons.article, color: AppColors.blackColor),
                          text: 'Blogs',
                        ),
                      ],
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text('Item ${index + 1}'),
                        subtitle: Text('Subtitle for item ${index + 1}'),
                      );
                    },
                  ),

                  // _menuWidget(),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _showStickyTopo,
              builder: (context, showStickyTopo, child) {
                if (showStickyTopo) {
                  return Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Material(
                      elevation: 4,
                      color: AppColors.primaryColor,
                      child: Container(
                        width: double.infinity,
                        child: SafeArea(
                          child: ListTile(
                            leading: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                            ),
                            title: Text(
                              widget.ong.name!,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.share, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _showSticky,
              builder: (context, showSticky, child) {
                if (showSticky) {
                  return Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Material(
                      elevation: 4,
                      color: AppColors.primaryColor,
                      child: Container(
                        width: double.infinity,
                        child: SafeArea(
                          child: TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.whiteColor,
                                  width: 3,
                                ),
                              ),
                            ),
                            labelColor: AppColors.whiteColor,
                            unselectedLabelColor: Colors.white60,
                            indicatorColor: AppColors.primaryColor,
                            automaticIndicatorColorAdjustment: true,
                            tabs: [
                              Tab(text: 'Recentes'),
                              Tab(text: 'Campanhas'),
                              Tab(text: 'Eventos'),
                              Tab(text: 'Blogs'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
