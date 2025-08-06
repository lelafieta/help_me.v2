import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sliver_snap/sliver_snap.dart';
import 'package:utueji/src/features/communities/domain/entities/community_entity.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/app_colors.dart';

class CommunityDetailsPage extends StatefulWidget {
  final CommunityEntity community;
  const CommunityDetailsPage({super.key, required this.community});

  @override
  State<CommunityDetailsPage> createState() => _CommunityDetailsPageState();
}

class _CommunityDetailsPageState extends State<CommunityDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
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
                  Tab(text: "Sobre"),
                  Tab(text: "Membros"),
                  Tab(text: "Eventos"),
                  Tab(text: "Galeria"),
                ],
              ),
            ),
          ),

          expandedContentHeight: 100,
          expandedContent: Stack(
            children: [
              Image.asset(
                Assets.images.colorfulLettersFormingWordCommunity.path,
                fit: BoxFit.contain,
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Container(color: Colors.black45),
              ),
            ],
          ),
          collapsedContent: SizedBox.shrink(),
          body: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 7,
            child: AboutWidget(community: widget.community),
          ),
        ),
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  final CommunityEntity community;
  const AboutWidget({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                community.name,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Center(child: Text(community.description)),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: community.members.length.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: " Membros"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      AppColors.whiteColor,
                    ),
                    backgroundColor: WidgetStateProperty.all(AppColors.error),
                    side: WidgetStateProperty.all(
                      BorderSide(color: AppColors.error),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Deixar Communidade",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          Text("Sobre", style: Theme.of(context).textTheme.titleMedium!),
          Text(community.description),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          ),
        ],
      ),
    );
  }
}
