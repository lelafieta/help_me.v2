import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';
import 'package:utueji/core/gen/assets.gen.dart';
import 'package:utueji/src/core/resources/images/app_images.dart';
import 'package:utueji/src/core/utils/image_helper.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/event_entity.dart';

class EventDetailPage extends StatefulWidget {
  final EventEntity event;
  const EventDetailPage({super.key, required this.event});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  double fundraisingGoal = 0.0;
  double fundsRaised = 0.0;
  String raisingGoals = "";
  String raising = "";
  double percentage = 0.0;
  String percentageText = "";
  double progressBarWidth = 0.0;
  DateTime now = DateTime.now();
  DateTime finishDate = DateTime.now();
  int diasRestantes = 0;
  ValueNotifier<Color> color = ValueNotifier(AppColors.whiteColor);
  @override
  Widget build(BuildContext context) {
    Duration diferenca = finishDate.difference(now);
    diasRestantes = diferenca.inDays;

    progressBarWidth = MediaQuery.sizeOf(context).width * percentage;

    return DefaultTabController(
      length: 4,
      child: SliverSnap(
        onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
        collapsedBackgroundColor: Colors.black,
        expandedBackgroundColor: Colors.transparent,
        backdropWidget: SizedBox.shrink(),
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
            child: TabBar(
              isScrollable: false,
              labelColor: AppColors.primaryColor,
              labelStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryColor,

              onTap: (index) {
                setState(() {
                  // pageSelectedIndex = index;
                });
              },
              tabs: [
                Tab(text: "Sumário"),
                Tab(text: "Comentários"),
                Tab(text: "Ajuda"),
              ],
            ),
          ),
        ),

        expandedContentHeight: 200,
        expandedContent: CachedNetworkImage(
          imageUrl: ImageHelper.buildImageUrl(widget.event.backgroundImageUrl!),
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        collapsedContent: SizedBox.shrink(),
        body: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 7,
          child: SummaryWidget(event: widget.event),
        ),
      ),
    );

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        if (innerBoxIsScrolled) {
          color.value = Colors.black;
        }
        return [
          ValueListenableBuilder(
            valueListenable: color,
            builder: (context, value, _) {
              return SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back, color: value),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share, color: value),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  // title: Text(event.title!),
                  background: CachedNetworkImage(
                    imageUrl: widget.event.backgroundImageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(150.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            widget.event.title!,
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.white,
                              child: SvgPicture.asset(
                                AppIcons.heartBold,
                                color: Colors.red,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.event.ong!.coverImageUrl!,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              title: Text(
                                widget.event.ong!.name!,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(widget.event.ong!.bio!),
                              trailing: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                ),
                                child: const Text(
                                  "Visualizar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ];
      },
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(Icons.access_time_sharp),
                    const SizedBox(width: 10),
                    Text(
                      "${AppDateUtilsHelper.formatDate(data: widget.event.startDate!, showTime: true)}\n${AppDateUtilsHelper.formatDate(data: widget.event.startDate!, showTime: true)}",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 10),
                    Text(widget.event.location!),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  "Detalhes do Evento",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.event.description!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Row(
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
                                text: "Contributos",
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Ver mais"),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppValues.s10,
                          ), // Define o raio da borda aqui
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Participar"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  final EventEntity event;
  const SummaryWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(event.title!, style: Theme.of(context).textTheme.titleLarge),

          Row(
            children: [
              SvgPicture.asset(Assets.icons.location),
              Text(event.location!),
            ],
          ),
          SizedBox(height: 10),

          (event.ong == null)
              ? ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipOval(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: (event.user!.avatarUrl == null)
                          ? Image.asset(
                              Assets.images.avatarBackground.path,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: ImageHelper.buildImageUrl(
                                event.user!.avatarUrl!,
                              ),
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
                  title: Text(
                    "Criado por",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        event.ong!.name!,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        width: 16,
                        AppIcons.shieldTrust,
                        color: AppColors.blueColor,
                      ),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: const Icon(Icons.call),
                  ),
                )
              : ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: (event.ong!.coverImageUrl == null)
                          ? Image.asset(
                              AppImages.coverBackground,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: event.ong!.coverImageUrl!,
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
                  title: Text(
                    "Criado por",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        event.ong!.name!,

                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        width: 16,
                        AppIcons.shieldTrust,
                        color: AppColors.blueColor,
                      ),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: const Icon(Icons.call),
                  ),
                ),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 16,
                  child: Stack(
                    children: [
                      AppUtils.contributeUserItem(0, 0, 0, null, Colors.black),
                      AppUtils.contributeUserItem(8, 0, 0, null, Colors.red),
                      AppUtils.contributeUserItem(16, 0, 0, null, Colors.green),
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
              TextButton(onPressed: () {}, child: const Text("Ver mais")),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white, // fundo claro
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoItem(
                  title: 'Data',
                  icon: Assets.icons.calendar2,
                  value: '31-07-2025',
                ),
                Container(width: 1, height: 30, color: Colors.grey.shade300),
                _InfoItem(
                  title: 'Hora',
                  icon: Assets.icons.clock,
                  value: '08:30min',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            event.description!,
            trimMode: TrimMode.Line,
            trimLines: 5,
            colorClickableText: Colors.red,
            trimCollapsedText: 'Mostrar mais',
            trimExpandedText: 'Mostrar menos',
            moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String icon;
  final String value;

  const _InfoItem({
    required this.title,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            SvgPicture.asset(icon, width: 20, color: Colors.black87),
            const SizedBox(width: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
