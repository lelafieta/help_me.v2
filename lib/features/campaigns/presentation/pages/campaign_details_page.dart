import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_snap/sliver_snap.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/campaign_entity.dart';

class CampaignDetailsPage extends StatefulWidget {
  final CampaignEntity campaign;
  const CampaignDetailsPage({super.key, required this.campaign});

  @override
  State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
}

class _CampaignDetailsPageState extends State<CampaignDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg',
    'https://img.freepik.com/free-photo/shapely-woman-vintage-dress-touching-her-glasses-outdoor-shot-interested-relaxed-girl-brown-outfit_197531-11308.jpg',
    'https://img.freepik.com/premium-photo/cheerful-lady-brown-outfit-looking-around-outdoor-portrait-fashionable-caucasian-model-with-short-wavy-hairstyle_197531-25791.jpg',
  ];

  final List<Tab> myTabs = [
    const Tab(text: 'Sobre'),
    const Tab(text: 'Documentos'),
    const Tab(text: 'Actualizações'),
    const Tab(text: 'Ajuda'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliverSnap(
          onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
          collapsedBackgroundColor: AppColors.primaryColor,
          expandedBackgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          collapsedBarHeight: 70,
          backdropWidget: Image.network(
            "https://picsum.photos/800/1200",
            fit: BoxFit.cover,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: myTabs,

                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
              ),
            ),
          ),
          expandedContentHeight: 200,
          expandedContent: SizedBox.shrink(),

          collapsedContent: SizedBox.shrink(),
          body: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                //
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.campaign.title!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svg.location1.path,
                        width: 20,
                        color: Colors.grey.shade900,
                      ),
                      SizedBox(width: 5),
                      Text(widget.campaign.location!),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          widget.campaign.category.name,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(text: "Criado em ", style: TextStyle()),
                            TextSpan(
                              text: AppUtils.formatDate(
                                data: widget.campaign.createdAt!,
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style
                                        .copyWith(
                                          fontSize: 18,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: "AOA ",
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: AppUtils.formatCurrency(
                                          widget.campaign.fundsRaised!,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(
                                      context,
                                    ).style.copyWith(fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: "Alvo ",
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: "AOA 3 mil",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            FAProgressBar(
                              currentValue:
                                  AppUtils.calculateFundraisingPercentage(
                                    widget.campaign.fundsRaised,
                                    widget.campaign.fundraisingGoal,
                                  ),
                              backgroundColor: AppColors.strokeColor,
                              progressColor: Colors.black,
                              changeProgressColor: Colors.red,
                              size: 15,
                              displayTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                              displayText: '%',
                            ),
                          ],
                        ),

                        // ListTile(
                        //   horizontalTitleGap: 5,
                        //   minLeadingWidth: 10,
                        //   minVerticalPadding: 5,
                        //   contentPadding: EdgeInsets.zero,
                        //   leading: Container(
                        //     width: 25,
                        //     height: 25,
                        //     decoration: BoxDecoration(
                        //       color: Colors.grey,
                        //       borderRadius: BorderRadius.circular(50),
                        //     ),
                        //   ),
                        //   title: Text("Lela ONG"),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 25,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 10,
                                top: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(
                                          context,
                                        ).style,
                                        children: [
                                          TextSpan(
                                            text: "+ 2,000 ",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Participantes",
                                            style: TextStyle(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Partilhar",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                Assets.svg.share.path,
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text("Lela ONG"),
                          SizedBox(width: 5),
                          SvgPicture.asset(
                            Assets.svg.verifiedCheckFill.path,
                            color: Colors.blue.shade900,
                            width: 20,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Conta Verificada",
                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                      trailing: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Visitar",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              height: 70,
              // color: Colors.red,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(Assets.svg.arrowLeftLg.path),
                  ),
                  Row(
                    children: [
                      // Container(
                      //   width: 40,
                      //   height: 40,
                      //   padding: EdgeInsets.all(5),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: SvgPicture.asset(Assets.svg.arrowLeftLg.path),
                      // ),
                      // SizedBox(width: 10),
                      Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(Assets.svg.heart.path),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Countdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeBox('01', 'dia(s)'),
                    const SizedBox(width: 4),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildTimeBox('58', 'hour(s)'),
                    const SizedBox(width: 4),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    _buildTimeBox('05', 'min(s)'),
                    const SizedBox(width: 4),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    _buildTimeBox('30', 'sec(s)'),
                  ],
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Doar Agora',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget buildTab(String label) {
    return Center(child: Text(label, style: const TextStyle(fontSize: 18)));
  }
}
