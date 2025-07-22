// import 'package:flutter/material.dart';
// import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sliver_snap/sliver_snap.dart';

// import '../../../../config/themes/app_colors.dart';
// import '../../../../core/utils/app_utils__';
// import '../../../../gen/assets.gen.dart';
// import '../../domain/entities/campaign_entity.dart';

// class CampaignDetailsPage extends StatefulWidget {
//   final CampaignEntity campaign;
//   const CampaignDetailsPage({super.key, required this.campaign});

//   @override
//   State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
// }

// class _CampaignDetailsPageState extends State<CampaignDetailsPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   static const List<String> sampleImages = [
//     'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg',
//     'https://img.freepik.com/free-photo/shapely-woman-vintage-dress-touching-her-glasses-outdoor-shot-interested-relaxed-girl-brown-outfit_197531-11308.jpg',
//     'https://img.freepik.com/premium-photo/cheerful-lady-brown-outfit-looking-around-outdoor-portrait-fashionable-caucasian-model-with-short-wavy-hairstyle_197531-25791.jpg',
//   ];

//   final List<Tab> myTabs = [
//     const Tab(text: 'Sobre'),
//     const Tab(text: 'Documentos'),
//     const Tab(text: 'Actualizações'),
//     const Tab(text: 'Ajuda'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: myTabs.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SliverSnap(
//           onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
//           collapsedBackgroundColor: AppColors.primaryColor,
//           expandedBackgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           collapsedBarHeight: 70,
//           backdropWidget: Image.network(
//             "https://picsum.photos/800/1200",
//             fit: BoxFit.cover,
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(50),
//             child: Container(
//               width: double.infinity,
//               height: 55,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).scaffoldBackgroundColor,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: TabBar(
//                 controller: _tabController,
//                 tabs: myTabs,

//                 indicatorColor: AppColors.primaryColor,
//                 labelColor: AppColors.primaryColor,
//                 unselectedLabelColor: Colors.black,
//                 isScrollable: true,
//               ),
//             ),
//           ),
//           expandedContentHeight: 200,
//           expandedContent: SizedBox.shrink(),

//           collapsedContent: SizedBox.shrink(),
//           body: Material(
//             color: Theme.of(context).scaffoldBackgroundColor,
//             elevation: 7,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 //
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.campaign.title!,
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       SvgPicture.asset(
//                         Assets.svg.location1.path,
//                         width: 20,
//                         color: Colors.grey.shade900,
//                       ),
//                       SizedBox(width: 5),
//                       Text(widget.campaign.location!),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         //
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 2,
//                         ),
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryColor.withOpacity(.1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(
//                           widget.campaign.category.name,
//                           style: TextStyle(
//                             color: AppColors.primaryColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),

//                       RichText(
//                         text: TextSpan(
//                           style: DefaultTextStyle.of(context).style,
//                           children: [
//                             TextSpan(text: "Criado em ", style: TextStyle()),
//                             TextSpan(
//                               text: AppUtils.formatDate(
//                                 data: widget.campaign.createdAt!,
//                               ),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(width: 1, color: Colors.grey.shade200),
//                     ),
//                     child: Column(
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 RichText(
//                                   text: TextSpan(
//                                     style: DefaultTextStyle.of(context).style
//                                         .copyWith(
//                                           fontSize: 18,
//                                           color: AppColors.primaryColor,
//                                           fontWeight: FontWeight.w700,
//                                         ),
//                                     children: [
//                                       TextSpan(
//                                         text: "AOA ",
//                                         style: TextStyle(),
//                                       ),
//                                       TextSpan(
//                                         text: AppUtils.formatCurrency(
//                                           widget.campaign.fundsRaised!,
//                                         ),
//                                         style: TextStyle(
//                                           color: AppColors.primaryColor,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 RichText(
//                                   text: TextSpan(
//                                     style: DefaultTextStyle.of(
//                                       context,
//                                     ).style.copyWith(fontSize: 14),
//                                     children: [
//                                       TextSpan(
//                                         text: "Alvo ",
//                                         style: TextStyle(),
//                                       ),
//                                       TextSpan(
//                                         text: AppUtils.formatCurrency(
//                                           widget.campaign.fundraisingGoal!,
//                                         ),
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10),
//                             FAProgressBar(
//                               currentValue:
//                                   AppUtils.calculateFundraisingPercentage(
//                                     widget.campaign.fundsRaised,
//                                     widget.campaign.fundraisingGoal,
//                                   ),
//                               backgroundColor: AppColors.strokeColor,
//                               progressColor: Colors.black,
//                               changeProgressColor: Colors.red,
//                               size: 15,
//                               displayTextStyle: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 10,
//                                 color: Colors.white,
//                               ),
//                               displayText: '%',
//                             ),
//                           ],
//                         ),

//                         // ListTile(
//                         //   horizontalTitleGap: 5,
//                         //   minLeadingWidth: 10,
//                         //   minVerticalPadding: 5,
//                         //   contentPadding: EdgeInsets.zero,
//                         //   leading: Container(
//                         //     width: 25,
//                         //     height: 25,
//                         //     decoration: BoxDecoration(
//                         //       color: Colors.grey,
//                         //       borderRadius: BorderRadius.circular(50),
//                         //     ),
//                         //   ),
//                         //   title: Text("Lela ONG"),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 25,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 left: 0,
//                                 top: 0,
//                                 child: Container(
//                                   width: 25,
//                                   height: 25,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Theme.of(
//                                         context,
//                                       ).scaffoldBackgroundColor,
//                                       width: 2,
//                                     ),
//                                   ),
//                                 ),
//                               ),

//                               Positioned(
//                                 left: 10,
//                                 top: 0,
//                                 child: Container(
//                                   width: 25,
//                                   height: 25,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Theme.of(
//                                         context,
//                                       ).scaffoldBackgroundColor,
//                                       width: 2,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 20,
//                                 top: 0,
//                                 child: Container(
//                                   width: 25,
//                                   height: 25,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Theme.of(
//                                         context,
//                                       ).scaffoldBackgroundColor,
//                                       width: 2,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned.fill(
//                                 child: Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 50),
//                                     child: RichText(
//                                       text: TextSpan(
//                                         style: DefaultTextStyle.of(
//                                           context,
//                                         ).style,
//                                         children: [
//                                           TextSpan(
//                                             text: "+ 2,000 ",
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: "Participantes",
//                                             style: TextStyle(),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       InkWell(
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             vertical: 5,
//                             horizontal: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey),
//                           ),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Partilhar",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               SizedBox(width: 5),
//                               SvgPicture.asset(
//                                 Assets.svg.share.path,
//                                 width: 18,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Text("${widget.campaign.description}"),
//                   SizedBox(height: 10),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(width: 1, color: Colors.grey.shade200),
//                     ),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.zero,
//                       horizontalTitleGap: 10,
//                       leading: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.black38,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           (widget.campaign.ong == null)
//                               ? Text(widget.campaign.user.fullName)
//                               : Text("${widget.campaign.ong!.name}"),
//                           SizedBox(width: 5),
//                           SvgPicture.asset(
//                             Assets.svg.verifiedCheckFill.path,
//                             color: Colors.blue.shade900,
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                       subtitle: Text(
//                         "Conta Verificada",
//                         style: TextStyle(color: Colors.blue.shade900),
//                       ),
//                       trailing: Container(
//                         width: 80,
//                         height: 30,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(color: AppColors.primaryColor),
//                         ),
//                         child: Center(
//                           child: (widget.campaign.ong == null)
//                               ? Text(
//                                   "Visitar",
//                                   style: TextStyle(
//                                     color: AppColors.primaryColor,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 )
//                               : Text(
//                                   "Ver Perfil",
//                                   style: TextStyle(
//                                     color: AppColors.primaryColor,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: SafeArea(
//             child: Container(
//               height: 70,
//               // color: Colors.red,
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 40,
//                     height: 40,
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: SvgPicture.asset(Assets.svg.arrowLeftLg.path),
//                   ),
//                   Row(
//                     children: [
//                       // Container(
//                       //   width: 40,
//                       //   height: 40,
//                       //   padding: EdgeInsets.all(5),
//                       //   decoration: BoxDecoration(
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.circular(10),
//                       //   ),
//                       //   child: SvgPicture.asset(Assets.svg.arrowLeftLg.path),
//                       // ),
//                       // SizedBox(width: 10),
//                       Container(
//                         width: 40,
//                         height: 40,
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: SvgPicture.asset(Assets.svg.heart.path),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             margin: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 8,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Countdown
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildTimeBox('01', 'dia(s)'),
//                     const SizedBox(width: 4),
//                     const Text(
//                       ':',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     _buildTimeBox('58', 'hour(s)'),
//                     const SizedBox(width: 4),
//                     const Text(
//                       ':',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     _buildTimeBox('05', 'min(s)'),
//                     const SizedBox(width: 4),
//                     const Text(
//                       ':',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     _buildTimeBox('30', 'sec(s)'),
//                   ],
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryColor,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 14,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Doar Agora',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeBox(String value, String label) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           decoration: BoxDecoration(
//             color: Colors.orange,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//       ],
//     );
//   }

//   Widget buildTab(String label) {
//     return Center(child: Text(label, style: const TextStyle(fontSize: 18)));
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/router/app_router.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/app_functions_utils_helper.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/usecases/get_campaign_by_id_usecase.dart';
import '../cubit/campaign_detail_cubit/campaign_detail_cubit.dart';
import '../cubit/campaign_detail_cubit/campaign_detail_state.dart';

class CampaignDetailsPage extends StatefulWidget {
  final CampaignEntity campaign;

  const CampaignDetailsPage({super.key, required this.campaign});

  @override
  State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
}

class _CampaignDetailsPageState extends State<CampaignDetailsPage> {
  int selected = 0;

  @override
  void initState() {
    context.read<CampaignDetailCubit>().getCampaignById(
      GetCampaignByIdParams(id: widget.campaign.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Arrecadação de Fundos',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Icon(Icons.arrow_back, color: Colors.black),
              actions: [Icon(Icons.more_vert, color: Colors.black)],
            ),

            body: BlocBuilder<CampaignDetailCubit, CampaignDetailState>(
              builder: (context, state) {
                if (state is CampaignDetailError) {
                  return Text(state.message);
                }
                if (state is CampaignDetailLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            (widget.campaign.imageCoverUrl == null)
                                ? Image.asset(
                                    Assets.images.coverBackground.path,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: 220,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            widget.campaign.imageCoverUrl!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 220,
                                      ),
                                    ),
                                  ),

                            Positioned(
                              right: 30,
                              top: 30,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  state.campaign.category.name.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "This campaign is verified",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),

                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  widget.campaign.title!,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: AppUtils.favoriteWidget(
                                    context: context,
                                    itemId: widget.campaign.id!,
                                    itemType: "campaign",
                                  ),
                                ),
                              ),

                              const Divider(),
                              Container(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child:
                                          (widget.campaign.imageCoverUrl ==
                                              null)
                                          ? Image.asset(
                                              Assets
                                                  .images
                                                  .coverBackground
                                                  .path,
                                              fit: BoxFit.cover,
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: widget
                                                  .campaign
                                                  .ong!
                                                  .coverImageUrl!,
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (
                                                    context,
                                                    url,
                                                    downloadProgress,
                                                  ) =>
                                                      CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                      ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                    ),
                                  ),
                                  title: Text(
                                    "Criado por",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        widget.campaign.ong!.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: 5),
                                      SvgPicture.asset(
                                        width: 16,
                                        Assets.icons.shieldTrust.path,
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
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 0,
                                ),
                                child: Text(
                                  "Valores a ser arrecadado",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      Assets.images.healthcare.path,
                                      width: 10,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Proxmo de 70% do fundo já foram colectados. A sua modesta doação pode impactar a urgência do necessitado.",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(
                                          context,
                                        ).style,
                                        children: [
                                          TextSpan(
                                            text: AppUtils.formatFullCurrency(
                                              widget.campaign.fundsRaised!,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                          ),
                                          const TextSpan(text: " / "),
                                          TextSpan(
                                            text: AppUtils.formatFullCurrency(
                                              widget.campaign.fundraisingGoal!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: AppColors.strokeColor,
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: FAProgressBar(
                                            currentValue:
                                                AppFuncionsUtilsHelper.calculateFundraisingPercentage(
                                                  widget.campaign.fundsRaised,
                                                  widget
                                                      .campaign
                                                      .fundraisingGoal,
                                                ),
                                            backgroundColor:
                                                AppColors.strokeColor,
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
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                AppUtils.contributorUsers(
                                                  context,
                                                  widget
                                                      .campaign
                                                      .campaignContributors!,
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  AppUtils.contributores(
                                                    widget
                                                        .campaign
                                                        .campaignContributors!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.timelapse_rounded,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 5),
                                          (AppDateUtilsHelper.daysRemainingUntil(
                                                    widget.campaign.endDate!,
                                                  ) ==
                                                  0)
                                              ? Text(
                                                  "Está acontecer",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              : (AppDateUtilsHelper.daysRemainingUntil(
                                                      widget.campaign.endDate!,
                                                    ) <
                                                    0)
                                              ? Text(
                                                  AppDateUtilsHelper.formatDate(
                                                    data: widget
                                                        .campaign
                                                        .endDate!,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              : Text(
                                                  "Faltando ${AppDateUtilsHelper.daysRemainingUntil(widget.campaign.endDate!)} dias",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Divider(),
                            ],
                          ),
                        ),
                        TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.fontFamily,
                            height: 5,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: AppStrings.fontFamily,
                          ),
                          unselectedLabelColor: Colors.black54,
                          isScrollable: true,
                          onTap: (index) {
                            setState(() {
                              selected = index;
                            });
                          },
                          tabs: [
                            Text("Sobre"),
                            Text("Documentações"),
                            Text("Actualizações"),
                            Text("Ajuda"),
                          ],
                        ),
                        _menuWidget(state.campaign),
                        SizedBox(height: 90),

                        // TabBarView(
                        //   children: [
                        //     AboutWidget(campaign: state.campaign),
                        //     DocumentWidget(campaign: state.campaign),
                        //     UpdateWidget(campaign: state.campaign),
                        //     HelpWidget(campaign: state.campaign),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: SafeArea(
              child: Align(
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
                    onPressed: () {
                      Get.toNamed(
                        AppRouter.paymentRoute,
                        arguments: widget.campaign,
                      );
                    },
                    child: const Text("Doar"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuWidget(CampaignEntity campaign) {
    switch (selected) {
      case 0:
        return AboutWidget(campaign: campaign);
      case 1:
        return DocumentWidget(campaign: campaign);
      case 2:
        return UpdateWidget(campaign: campaign);
      case 3:
        return HelpWidget(campaign: campaign);
      default:
        return Text("4");
    }
  }
}

class UpdateWidget extends StatelessWidget {
  const UpdateWidget({super.key, required this.campaign});

  final CampaignEntity campaign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: (campaign.campaignUpdates!.isEmpty)
          ? Center(child: Text("Sem actualizações"))
          : ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final update = campaign.campaignUpdates![index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Update #${index + 1}"),
                            Text(
                              "${AppDateUtilsHelper.formatDate(data: update.createdAt!)}",
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          update.title!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        Text(update.description!),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: campaign.campaignUpdates!.length,
            ),
    );
  }
}

class DocumentWidget extends StatefulWidget {
  final CampaignEntity campaign;
  const DocumentWidget({super.key, required this.campaign});

  @override
  State<DocumentWidget> createState() => _DocumentWidgetState();
}

class _DocumentWidgetState extends State<DocumentWidget> {
  List<bool> counterApprovedDoc = [];

  @override
  void initState() {
    super.initState();
    widget.campaign.campaignComments!.forEach((element) {
      // if (element.isApproved == true) {
      //   counterApprovedDoc.add(true);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 20),
          (widget.campaign.campaignDocuments!.isEmpty)
              ? SizedBox.shrink()
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (counterApprovedDoc.length ==
                              widget.campaign.campaignDocuments!.length)
                          ? SvgPicture.asset(
                              Assets.icons.shieldTrust.path,
                              color: AppColors.primaryColor,
                            )
                          : Icon(Icons.close, color: Colors.red),
                      const SizedBox(width: 10),
                      (counterApprovedDoc.length ==
                              widget.campaign.campaignDocuments!.length)
                          ? Text(
                              "Documentos aprovados e verificados",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Text(
                              "Documentos não verificados",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ],
                  ),
                ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 280,
              height: 180,
              color: Colors.black12,
              child: (widget.campaign.campaignDocuments!.isEmpty)
                  ? Center(child: Text("Vazio"))
                  : PDF(
                      enableSwipe: false,
                      swipeHorizontal: false,
                      autoSpacing: false,
                      pageFling: false,
                      fitEachPage: false,
                      fitPolicy: FitPolicy.HEIGHT,
                      pageSnap: false,
                      backgroundColor: Colors.grey,
                      preventLinkNavigation: true,
                      onError: (error) {
                        print(error.toString());
                      },
                      onPageError: (page, error) {
                        print('$page: ${error.toString()}');
                      },
                      onPageChanged: ((int? page, int? total) {
                        print('page change: $page/$total');
                      }),
                    ).fromUrl(
                      widget.campaign.campaignDocuments![0].documentPath,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 280,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.black12,
                      child: (widget.campaign.campaignDocuments!.length <= 1)
                          ? Center(child: Text("Vazio"))
                          : PDF(
                              enableSwipe: false,
                              swipeHorizontal: false,
                              autoSpacing: false,
                              pageFling: false,
                              fitEachPage: false,
                              fitPolicy: FitPolicy.HEIGHT,
                              pageSnap: false,
                              backgroundColor: Colors.grey,
                              preventLinkNavigation: true,
                              onError: (error) {
                                print(error.toString());
                              },
                              onPageError: (page, error) {
                                print('$page: ${error.toString()}');
                              },
                              onPageChanged: ((int? page, int? total) {
                                print('page change: $page/$total');
                              }),
                            ).fromUrl(
                              widget
                                  .campaign
                                  .campaignDocuments![1]
                                  .documentPath!,
                            ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.black12,
                      child: (widget.campaign.campaignDocuments!.length <= 2)
                          ? Center(child: Text("Vazio"))
                          : PDF(
                              enableSwipe: false,
                              swipeHorizontal: false,
                              autoSpacing: false,
                              pageFling: false,
                              fitEachPage: false,
                              fitPolicy: FitPolicy.HEIGHT,
                              pageSnap: false,
                              backgroundColor: Colors.grey,
                              preventLinkNavigation: true,
                              onError: (error) {
                                print(error.toString());
                              },
                              onPageError: (page, error) {
                                print('$page: ${error.toString()}');
                              },
                              onPageChanged: ((int? page, int? total) {
                                print('page change: $page/$total');
                              }),
                            ).fromUrl(
                              widget
                                  .campaign
                                  .campaignDocuments![2]
                                  .documentPath!,
                            ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.black12,
                      child: (widget.campaign.campaignDocuments!.length < 4)
                          ? Center(child: Text("Vazio"))
                          : PDF(
                              enableSwipe: false,
                              swipeHorizontal: false,
                              autoSpacing: false,
                              pageFling: false,
                              fitEachPage: false,
                              fitPolicy: FitPolicy.HEIGHT,
                              pageSnap: true,
                              backgroundColor: Colors.grey,
                              preventLinkNavigation: true,
                              onError: (error) {
                                print(error.toString());
                              },
                              onPageError: (page, error) {
                                print('$page: ${error.toString()}');
                              },
                              onPageChanged: ((int? page, int? total) {
                                print('page change: $page/$total');
                              }),
                            ).fromUrl(
                              widget
                                  .campaign
                                  .campaignDocuments![3]
                                  .documentPath!,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutWidget extends StatefulWidget {
  final CampaignEntity campaign;
  const AboutWidget({super.key, required this.campaign});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: (widget.campaign.campaignMidias!.isEmpty)
                      ? (widget.campaign.imageCoverUrl == null)
                            ? Image.asset(Assets.images.coverBackground.path)
                            : InkWell(
                                onTap: () => _openPreview(
                                  context,
                                  "local",
                                  Assets.images.coverBackground.path,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.campaign.imageCoverUrl!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                ),
                              )
                      : CarouselSlider.builder(
                          itemCount: widget.campaign.campaignMidias!.length,
                          itemBuilder:
                              (BuildContext context, int itemIndex, int _) {
                                final campaignMidia =
                                    widget.campaign.campaignMidias![itemIndex];

                                return GestureDetector(
                                  onTap: () => _openPreview(
                                    context,
                                    campaignMidia.midiaType,
                                    campaignMidia.midiaUrl,
                                  ),
                                  child: Container(
                                    color: AppColors.primaryColor,
                                    width: double.infinity,
                                    height: 200,
                                    child: campaignMidia.midiaType == "video"
                                        ? VideoThumbnail(
                                            videoUrl: campaignMidia.midiaUrl!,
                                          )
                                        : CachedNetworkImage(
                                            width: double.infinity,
                                            height: 200,
                                            fit: BoxFit.cover,
                                            imageUrl: campaignMidia.midiaUrl!,
                                          ),
                                  ),
                                );
                              },
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.95,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            animateToClosest: true,
                            autoPlay: false,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          widget.campaign.title!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text:
                                    (widget.campaign.campaignType ==
                                        "Um Individuo")
                                    ? "Beneficiário: "
                                    : "Intsituicao: ",
                              ),
                              TextSpan(
                                text: (widget.campaign.beneficiaryName == null)
                                    ? "Não especificado"
                                    : widget.campaign.beneficiaryName!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.campaign.description!,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openPreview(BuildContext context, String mediaType, String mediaUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FullScreenPreview(mediaType: mediaType, mediaUrl: mediaUrl),
      ),
    );
  }
}

class VideoThumbnail extends StatefulWidget {
  final String videoUrl;

  const VideoThumbnail({super.key, required this.videoUrl});

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : const Center(child: CircularProgressIndicator()),
        const Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
      ],
    );
  }
}

class FullScreenPreview extends StatefulWidget {
  final String mediaType;
  final String mediaUrl;

  const FullScreenPreview({
    Key? key,
    required this.mediaType,
    required this.mediaUrl,
  }) : super(key: key);

  @override
  State<FullScreenPreview> createState() => _FullScreenPreviewState();
}

class _FullScreenPreviewState extends State<FullScreenPreview> {
  late VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.mediaType == 'video') {
      _videoController = VideoPlayerController.network(widget.mediaUrl)
        ..initialize().then((_) {
          setState(() {
            _videoController!.play();
          });
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: widget.mediaType == 'video'
            ? _videoController != null && _videoController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController!.value.aspectRatio,
                      child: VideoPlayer(_videoController!),
                    )
                  : const Center(child: CircularProgressIndicator())
            : CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
                imageUrl: widget.mediaUrl,
              ),
      ),
    );
  }
}

class HelpWidget extends StatelessWidget {
  const HelpWidget({super.key, required this.campaign});
  final CampaignEntity campaign;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      children: [
        ExpansionTile(
          title: Text('Comentários [${campaign.campaignComments!.length}]'),
          children: [
            Container(
              height: 200, // Define a altura da lista de comentários
              child: ListView.builder(
                itemCount: campaign.campaignComments!.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final comment = campaign.campaignComments![index];
                  return ListTile(
                    // titleAlignment: ListTileTitleAlignment.center,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 40,
                        height: 40,
                        child: CachedNetworkImage(
                          imageUrl: comment.user!.avatarUrl!,
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
                      comment.user!.fullName!,
                      style: TextStyle(color: Colors.black87),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppDateUtilsHelper.formatDate(
                            data: comment.createdAt!,
                            showTime: true,
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          comment.description!,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Perguntas frequentes'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Qual é o objetivo desta campanha?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Nosso objetivo é arrecadar fundos e itens para ajudar pessoas em situação de vulnerabilidade.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2. Quem está organizando esta campanha?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- A campanha é organizada por um grupo de voluntários e apoiadores.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3. Para onde vai o dinheiro ou os itens arrecadados?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Todas as doações serão direcionadas para comunidades carentes e instituições beneficentes.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4. Como posso contribuir?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Você pode doar dinheiro, alimentos, roupas ou se voluntariar para ajudar na distribuição.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      '5. Há um valor mínimo para doação?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Não, qualquer contribuição é bem-vinda e fará a diferença!',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Denunciar esta campanha'),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selecione um motivo:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    items: [
                      DropdownMenuItem(value: 'Fraude', child: Text('Fraude')),
                      DropdownMenuItem(
                        value: 'Informações falsas',
                        child: Text('Informações falsas'),
                      ),
                      DropdownMenuItem(
                        value: 'Uso indevido',
                        child: Text('Uso indevido dos fundos'),
                      ),
                      DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escolha um motivo',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Descreva o problema:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Descreva o motivo do seu relatório...',
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Aqui adicionamos a lógica para enviar o relatório
                    },
                    child: Text('Enviar denúncia'),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Para qualquer dúvida contacte o respetivo ativista',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: 'Call: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: campaign.phoneNumber,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class CampaignDetailsPage extends StatefulWidget {
//   final CampaignEntity campaign;
//   const CampaignDetailsPage({super.key, required this.campaign});

//   @override
//   State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
// }

// class _CampaignDetailsPageState extends State<CampaignDetailsPage> {
//   ValueNotifier<Color> color = ValueNotifier(AppColors.whiteColor);
//   List<String> menuList = ["Sobre", "Documentos", "Actualizações", "Ajuda"];
//   int selected = 0;

  // @override
  // void initState() {
  //   context.read<CampaignDetailCubit>().getCampaignById(widget.campaign.id!);
  //   super.initState();
  // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CampaignDetailCubit, CampaignDetailState>(
//       builder: (context, state) {
//         if (state is CampaignDetailLoaded) {
//           final campaign = state.campaign;

//           return NestedScrollView(
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//                   if (innerBoxIsScrolled) {
//                     color.value = Colors.black;
//                   }
//                   return [
//                     ValueListenableBuilder(
//                       valueListenable: color,
//                       builder: (context, value, _) {
//                         return SliverAppBar(
//                           expandedHeight: 300.0,
//                           floating: false,
//                           pinned: true,
//                           leading: IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: Icon(Icons.arrow_back, color: value),
//                           ),
//                           actions: [
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(Icons.share, color: value),
//                             ),
//                           ],
//                           flexibleSpace: FlexibleSpaceBar(
//                             // title: Text(widget.campaign.title!),
                            // background: (widget.campaign.imageCoverUrl == null)
                            //     ? Image.asset(
                            //         AppImages.coverBackground,
                            //         fit: BoxFit.cover,
                            //       )
                            //     : CachedNetworkImage(
                            //         imageUrl: campaign.imageCoverUrl!,
                            //         fit: BoxFit.cover,
                            //       ),
//                           ),
//                           bottom: PreferredSize(
//                             preferredSize: const Size.fromHeight(150.0),
//                             child: Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               decoration: BoxDecoration(
//                                 color: Theme.of(
//                                   context,
//                                 ).scaffoldBackgroundColor,
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(20.0),
//                                   topRight: Radius.circular(20.0),
//                                 ),
//                               ),
//                               child: Column(
//                                 children: [
                                  // ListTile(
                                  //   title: Text(
                                  //     campaign.title!,
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .titleLarge!
                                  //         .copyWith(
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //     maxLines: 2,
                                  //     overflow: TextOverflow.ellipsis,
                                  //   ),
                                  //   trailing: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(50),
                                  //     child: AppUtils.favoriteWidget(
                                  //       context: context,
                                  //       itemId: widget.campaign.id!,
                                  //       itemType: "campaign",
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10,
                                  //   ),
                                  //   child: Row(
                                  //     children: [
                                  //       Expanded(
                                  //         child: Row(
                                  //           children: [
                                  //             const Icon(
                                  //               Icons.location_on,
                                  //               size: 20,
                                  //             ),
                                  //             const SizedBox(width: 8),
                                  //             Expanded(
                                  //               child: Text(
                                  //                 campaign.location!,
                                  //                 style: const TextStyle(
                                  //                   fontSize: 14,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       const SizedBox(width: 10),
//                                         Expanded(
                                          // child: Row(
                                          //   children: [
                                          //     Icon(Icons.category, size: 20),
                                          //     SizedBox(width: 8),
                                          //     Expanded(
                                          //       child: Text(
                                          //         state.campaign.category!.name
                                          //             .toString(),
                                          //         style: TextStyle(
                                          //           fontSize: 14,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ];
//                 },
//             body: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).scaffoldBackgroundColor,
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
                    // const Divider(),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: ListTile(
                    //     contentPadding: const EdgeInsets.all(0),
                    //     leading: ClipRRect(
                    //       borderRadius: BorderRadius.circular(50),
                    //       child: Container(
                    //         width: 50,
                    //         height: 50,
                    //         child: (widget.campaign.imageCoverUrl == null)
                    //             ? Image.asset(
                    //                 AppImages.coverBackground,
                    //                 fit: BoxFit.cover,
                    //               )
                    //             : CachedNetworkImage(
                    //                 imageUrl: campaign.ong!.coverImageUrl!,
                    //                 fit: BoxFit.cover,
                    //                 progressIndicatorBuilder:
                    //                     (context, url, downloadProgress) =>
                    //                         CircularProgressIndicator(
                    //                           value: downloadProgress.progress,
                    //                         ),
                    //                 errorWidget: (context, url, error) =>
                    //                     const Icon(Icons.error),
                    //               ),
                    //       ),
                    //     ),
                    //     title: Text(
                    //       "Criado por",
                    //       style: Theme.of(context).textTheme.bodyMedium,
                    //     ),
                    //     subtitle: Row(
                    //       children: [
                    //         Text(
                    //           campaign.ong!.name!,
                    //           style: Theme.of(context).textTheme.titleMedium!
                    //               .copyWith(fontWeight: FontWeight.bold),
                    //           overflow: TextOverflow.ellipsis,
                    //         ),
                    //         const SizedBox(width: 5),
                    //         SvgPicture.asset(
                    //           width: 16,
                    //           AppIcons.shieldTrust,
                    //           color: AppColors.blueColor,
                    //         ),
                    //       ],
                    //     ),
                    //     trailing: Container(
                    //       padding: const EdgeInsets.all(5),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         border: Border.all(color: AppColors.grey),
                    //       ),
                    //       child: const Icon(Icons.call),
                    //     ),
                    //   ),
                    // ),
                    // const Divider(),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     vertical: 20,
                    //     horizontal: 10,
                    //   ),
                    //   child: Text(
                    //     "Valores a ser arrecadado",
                    //     style: Theme.of(context).textTheme.titleMedium!
                    //         .copyWith(
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black54,
                    //         ),
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Container(
                    //     width: 50,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: Colors.black12),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Image.asset(AppImages.healthcare, width: 10),
                    //     ),
                    //   ),
                    //   title: Text(
                    //     "Proxmo de 70% do fundo já foram colectados. A sua modesta doação pode impactar a urgência do necessitado.",
                    //     style: Theme.of(context).textTheme.bodyMedium,
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const SizedBox(height: 20),
                    //       RichText(
                    //         text: TextSpan(
                    //           style: DefaultTextStyle.of(context).style,
                    //           children: [
                    //             TextSpan(
                    //               text: AppUtils.formatFullCurrency(
                    //                 widget.campaign.fundsRaised!,
                    //               ),
                    //               style: Theme.of(context).textTheme.titleSmall!
                    //                   .copyWith(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 18,
                    //                   ),
                    //             ),
                    //             const TextSpan(text: " / "),
                    //             TextSpan(
                    //               text: AppUtils.formatFullCurrency(
                    //                 widget.campaign.fundraisingGoal!,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       const SizedBox(height: 10),
                    //       Stack(
                    //         children: [
                    //           Container(
                    //             width: double.infinity,
                    //             height: 15,
                    //             decoration: BoxDecoration(
                    //               color: AppColors.strokeColor,
                    //               borderRadius: BorderRadius.circular(100),
                    //             ),
                    //           ),
                    //           Positioned(
                    //             child: FAProgressBar(
                    //               currentValue:
                    //                   AppFuncionsUtilsHelper.calculateFundraisingPercentage(
                    //                     campaign.fundsRaised,
                    //                     campaign.fundraisingGoal,
                    //                   ),
                    //               backgroundColor: AppColors.strokeColor,
                    //               progressColor: Colors.black,
                    //               changeProgressColor: Colors.red,
                    //               size: 15,
                    //               displayTextStyle: const TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 10,
                    //                 color: Colors.white,
                    //               ),
                    //               displayText: '%',
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       const SizedBox(height: 10),
                    //       Container(
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //               child: InkWell(
                    //                 onTap: () {
                    //                   AppUtils.contributorUsers(
                    //                     context,
                    //                     widget.campaign.contributors!,
                    //                   );
                    //                 },
                    //                 child: Row(
                    //                   children: [
                    //                     AppUtils.contributores(
                    //                       widget.campaign.contributors!,
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             const Icon(Icons.timelapse_rounded, size: 16),
                    //             const SizedBox(width: 5),
                    //             (AppDateUtilsHelper.daysRemainingUntil(
                    //                       campaign.endDate!,
                    //                     ) ==
                    //                     0)
                    //                 ? Text(
                    //                     "Está acontecer",
                    //                     style: const TextStyle(fontSize: 12),
                    //                   )
                    //                 : (AppDateUtilsHelper.daysRemainingUntil(
                    //                         campaign.endDate!,
                    //                       ) <
                    //                       0)
                    //                 ? Text(
                    //                     AppDateUtilsHelper.formatDate(
                    //                       data: campaign.endDate!,
                    //                     ),
                    //                     style: const TextStyle(fontSize: 12),
                    //                   )
                    //                 : Text(
                    //                     "Faltando ${AppDateUtilsHelper.daysRemainingUntil(campaign.endDate!)} dias",
                    //                     style: const TextStyle(fontSize: 12),
                    //                   ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                    //     child: ElevatedButton(
                    //       style: ButtonStyle(
                    //         shape:
                    //             MaterialStateProperty.all<
                    //               RoundedRectangleBorder
                    //             >(
                    //               RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(
                    //                   AppValues.s10,
                    //                 ), // Define o raio da borda aqui
                    //               ),
                    //             ),
                    //       ),
                    //       onPressed: () {
                    //         Get.toNamed(
                    //           AppRoutes.paymentRoute,
                    //           arguments: widget.campaign,
                    //         );
                    //       },
                    //       child: const Text("Doar"),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // const Divider(),
//                     Container(
//                       width: double.infinity,
//                       height: 45,
//                       decoration: BoxDecoration(
//                         // border: Border(
//                         //   bottom: BorderSide(
//                         //     width: 2,
//                         //     color: Colors.black12,
//                         //   ),
//                         // ),
//                       ),
//                       child: ListView.separated(
//                         physics: const ClampingScrollPhysics(),
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               setState(() {
//                                 selected = index;
//                               });
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                               ),
//                               decoration: BoxDecoration(
//                                 border: (index == selected)
//                                     ? const Border(
//                                         bottom: BorderSide(
//                                           width: 2,
//                                           color: Colors.black,
//                                         ),
//                                       )
//                                     : Border.all(
//                                         width: 0,
//                                         color: Colors.transparent,
//                                       ),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   menuList[index].toString(),
//                                   style: (index != selected)
//                                       ? Theme.of(context).textTheme.bodyMedium
//                                       : Theme.of(
//                                           context,
//                                         ).textTheme.bodyMedium!.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black,
//                                         ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return const SizedBox(width: 10);
//                         },
//                         itemCount: menuList.length,
//                       ),
//                     ),
//                     _menuWidget(state.campaign),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Widget _menuWidget(CampaignEntity campaign) {
//     switch (selected) {
//       case 0:
//         return AboutWidget(campaign: campaign);
//       case 1:
//         return DocumentWidget(campaign: campaign);
//       case 2:
//         return UpdateWidget(campaign: campaign);
//       case 3:
//         return HelpWidget(campaign: campaign);
//       default:
//         return Text("4");
//     }
//   }
// }

// class UpdateWidget extends StatelessWidget {
//   const UpdateWidget({super.key, required this.campaign});

//   final CampaignEntity campaign;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: (campaign.updates!.length == 0)
//           ? Center(child: Text("Sem actualizações"))
//           : ListView.separated(
//               physics: ClampingScrollPhysics(),
//               shrinkWrap: true,
//               padding: EdgeInsets.zero,
//               itemBuilder: (context, index) {
//                 final update = campaign.updates![index];
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Update #${index + 1}"),
//                             Text(
//                               "${AppDateUtilsHelper.formatDate(data: update.createdAt!)}",
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           update.title!,
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         const SizedBox(height: 20),
//                         Text(update.description!),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const SizedBox(height: 10);
//               },
//               itemCount: campaign.updates!.length,
//             ),
//     );
//   }
// }

// class DocumentWidget extends StatefulWidget {
//   final CampaignEntity campaign;
//   const DocumentWidget({super.key, required this.campaign});

//   @override
//   State<DocumentWidget> createState() => _DocumentWidgetState();
// }

// class _DocumentWidgetState extends State<DocumentWidget> {
//   List<bool> counterApprovedDoc = [];

//   @override
//   void initState() {
//     super.initState();
//     widget.campaign.campaignDocuments!.forEach((element) {
//       if (element.isApproved == true) {
//         counterApprovedDoc.add(true);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             (widget.campaign.campaignDocuments!.length == 0)
//                 ? SizedBox.shrink()
//                 : Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         (counterApprovedDoc.length ==
//                                 widget.campaign.campaignDocuments!.length)
//                             ? SvgPicture.asset(
//                                 AppIcons.shieldTrust,
//                                 color: AppColors.primaryColor,
//                               )
//                             : Icon(Icons.close, color: Colors.red),
//                         const SizedBox(width: 10),
//                         (counterApprovedDoc.length ==
//                                 widget.campaign.campaignDocuments!.length)
//                             ? Text(
//                                 "Documentos aprovados e verificados",
//                                 style: TextStyle(
//                                   color: AppColors.primaryColor,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               )
//                             : Text(
//                                 "Documentos não verificados",
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ),
//             const SizedBox(height: 20),
//             Center(
//               child: Container(
//                 width: 280,
//                 height: 180,
//                 color: Colors.black12,
//                 child: (widget.campaign.campaignDocuments!.length < 1)
//                     ? Center(child: Text("Vazio"))
//                     : PDF(
//                         enableSwipe: false,
//                         swipeHorizontal: false,
//                         autoSpacing: false,
//                         pageFling: false,
//                         fitEachPage: false,
//                         fitPolicy: FitPolicy.HEIGHT,
//                         pageSnap: false,
//                         backgroundColor: Colors.grey,
//                         preventLinkNavigation: true,
//                         onError: (error) {
//                           print(error.toString());
//                         },
//                         onPageError: (page, error) {
//                           print('$page: ${error.toString()}');
//                         },
//                         onPageChanged: ((int? page, int? total) {
//                           print('page change: $page/$total');
//                         }),
//                       ).fromUrl(widget.campaign.campaignDocuments![0].documentPath!),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Center(
//               child: Container(
//                 width: 280,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: 50,
//                         height: 100,
//                         color: Colors.black12,
//                         child: (widget.campaign.campaignDocuments!.length <= 1)
//                             ? Center(child: Text("Vazio"))
//                             : PDF(
//                                 enableSwipe: false,
//                                 swipeHorizontal: false,
//                                 autoSpacing: false,
//                                 pageFling: false,
//                                 fitEachPage: false,
//                                 fitPolicy: FitPolicy.HEIGHT,
//                                 pageSnap: false,
//                                 backgroundColor: Colors.grey,
//                                 preventLinkNavigation: true,
//                                 onError: (error) {
//                                   print(error.toString());
//                                 },
//                                 onPageError: (page, error) {
//                                   print('$page: ${error.toString()}');
//                                 },
//                                 onPageChanged: ((int? page, int? total) {
//                                   print('page change: $page/$total');
//                                 }),
//                               ).fromUrl(
//                                 widget.campaign.campaignDocuments![1].documentPath!,
//                               ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Container(
//                         width: 50,
//                         height: 100,
//                         color: Colors.black12,
//                         child: (widget.campaign.campaignDocuments!.length <= 2)
//                             ? Center(child: Text("Vazio"))
//                             : PDF(
//                                 enableSwipe: false,
//                                 swipeHorizontal: false,
//                                 autoSpacing: false,
//                                 pageFling: false,
//                                 fitEachPage: false,
//                                 fitPolicy: FitPolicy.HEIGHT,
//                                 pageSnap: false,
//                                 backgroundColor: Colors.grey,
//                                 preventLinkNavigation: true,
//                                 onError: (error) {
//                                   print(error.toString());
//                                 },
//                                 onPageError: (page, error) {
//                                   print('$page: ${error.toString()}');
//                                 },
//                                 onPageChanged: ((int? page, int? total) {
//                                   print('page change: $page/$total');
//                                 }),
//                               ).fromUrl(
//                                 widget.campaign.campaignDocuments![2].documentPath!,
//                               ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Container(
//                         width: 50,
//                         height: 100,
//                         color: Colors.black12,
//                         child: (widget.campaign.campaignDocuments!.length < 4)
//                             ? Center(child: Text("Vazio"))
//                             : PDF(
//                                 enableSwipe: false,
//                                 swipeHorizontal: false,
//                                 autoSpacing: false,
//                                 pageFling: false,
//                                 fitEachPage: false,
//                                 fitPolicy: FitPolicy.HEIGHT,
//                                 pageSnap: true,
//                                 backgroundColor: Colors.grey,
//                                 preventLinkNavigation: true,
//                                 onError: (error) {
//                                   print(error.toString());
//                                 },
//                                 onPageError: (page, error) {
//                                   print('$page: ${error.toString()}');
//                                 },
//                                 onPageChanged: ((int? page, int? total) {
//                                   print('page change: $page/$total');
//                                 }),
//                               ).fromUrl(
//                                 widget.campaign.campaignDocuments![3].documentPath!,
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AboutWidget extends StatefulWidget {
//   final CampaignEntity campaign;
//   const AboutWidget({super.key, required this.campaign});

//   @override
//   State<AboutWidget> createState() => _AboutWidgetState();
// }

// class _AboutWidgetState extends State<AboutWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     height: 200,
//                     child: (widget.campaign.campaignMidias!.isEmpty)
//                         ? (widget.campaign.imageCoverUrl == null)
//                               ? Image.asset(AppImages.coverBackground)
//                               : InkWell(
//                                   onTap: () => _openPreview(
//                                     context,
//                                     "local",
//                                     AppImages.coverBackground,
//                                   ),
//                                   child: CachedNetworkImage(
//                                     imageUrl: widget.campaign.imageCoverUrl!,
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) =>
//                                         const CircularProgressIndicator(),
//                                   ),
//                                 )
//                         : CarouselSlider.builder(
//                             itemCount: widget.campaign.campaignMidias!.length,
//                             itemBuilder:
//                                 (BuildContext context, int itemIndex, int _) {
//                                   final campaignMidia =
//                                       widget.campaign.campaignMidias![itemIndex];

//                                   return GestureDetector(
//                                     onTap: () => _openPreview(
//                                       context,
//                                       campaignMidia.midiaType!,
//                                       campaignMidia.midiaUrl!,
//                                     ),
//                                     child: Container(
//                                       color: AppColors.primaryColor,
//                                       width: double.infinity,
//                                       height: 200,
//                                       child: campaignMidia.midiaType == "video"
//                                           ? VideoThumbnail(
//                                               videoUrl: campaignMidia.midiaUrl!,
//                                             )
//                                           : CachedNetworkImage(
//                                               width: double.infinity,
//                                               height: 200,
//                                               fit: BoxFit.cover,
//                                               imageUrl: campaignMidia.midiaUrl!,
//                                             ),
//                                     ),
//                                   );
//                                 },
//                             options: CarouselOptions(
//                               height: 200,
//                               aspectRatio: 16 / 9,
//                               viewportFraction: 0.95,
//                               initialPage: 0,
//                               enableInfiniteScroll: true,
//                               animateToClosest: true,
//                               autoPlay: false,
//                               scrollDirection: Axis.horizontal,
//                             ),
//                           ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           title: Text(
//                             widget.campaign.title!,
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                           subtitle: RichText(
//                             text: TextSpan(
//                               style: Theme.of(context).textTheme.bodyMedium,
//                               children: [
//                                 TextSpan(
//                                   text:
//                                       (widget.campaign.campaignType ==
//                                           "Um Individuo")
//                                       ? "Beneficiário: "
//                                       : "Intsituicao: ",
//                                 ),
//                                 TextSpan(
//                                   text:
//                                       (widget.campaign.beneficiaryName == null)
//                                       ? "Não especificado"
//                                       : widget.campaign.beneficiaryName!,
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           widget.campaign.description!,
//                           style: const TextStyle(color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _openPreview(BuildContext context, String mediaType, String mediaUrl) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             FullScreenPreview(mediaType: mediaType, mediaUrl: mediaUrl),
//       ),
//     );
//   }
// }

// class VideoThumbnail extends StatefulWidget {
//   final String videoUrl;

//   const VideoThumbnail({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   _VideoThumbnailState createState() => _VideoThumbnailState();
// }

// class _VideoThumbnailState extends State<VideoThumbnail> {
//   late VideoPlayerController _videoController;

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         _videoController.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _videoController.value.aspectRatio,
//                 child: VideoPlayer(_videoController),
//               )
//             : const Center(child: CircularProgressIndicator()),
//         const Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
//       ],
//     );
//   }
// }

// class FullScreenPreview extends StatefulWidget {
//   final String mediaType;
//   final String mediaUrl;

//   const FullScreenPreview({
//     Key? key,
//     required this.mediaType,
//     required this.mediaUrl,
//   }) : super(key: key);

//   @override
//   _FullScreenPreviewState createState() => _FullScreenPreviewState();
// }

// class _FullScreenPreviewState extends State<FullScreenPreview> {
//   late VideoPlayerController? _videoController;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.mediaType == 'video') {
//       _videoController = VideoPlayerController.network(widget.mediaUrl)
//         ..initialize().then((_) {
//           setState(() {
//             _videoController!.play();
//           });
//         });
//     }
//   }

//   @override
//   void dispose() {
//     _videoController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(backgroundColor: Colors.black),
//       body: Center(
//         child: widget.mediaType == 'video'
//             ? _videoController != null && _videoController!.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: _videoController!.value.aspectRatio,
//                       child: VideoPlayer(_videoController!),
//                     )
//                   : const Center(child: CircularProgressIndicator())
//             : CachedNetworkImage(
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.contain,
//                 imageUrl: widget.mediaUrl,
//               ),
//       ),
//     );
//   }
// }

// class HelpWidget extends StatelessWidget {
//   const HelpWidget({super.key, required this.campaign});
//   final CampaignEntity campaign;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ExpansionTile(
//           title: Text('Comentários [${campaign.comments!.length}]'),
//           children: [
//             Container(
//               height: 200, // Define a altura da lista de comentários
//               child: ListView.builder(
//                 itemCount: campaign.comments!.length,
//                 padding: EdgeInsets.zero,
//                 itemBuilder: (context, index) {
//                   final comment = campaign.comments![index];
//                   return ListTile(
//                     // titleAlignment: ListTileTitleAlignment.center,
//                     leading: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         child: CachedNetworkImage(
//                           imageUrl: comment.user!.avatarUrl!,
//                           fit: BoxFit.cover,
//                           progressIndicatorBuilder:
//                               (context, url, downloadProgress) =>
//                                   CircularProgressIndicator(
//                                     value: downloadProgress.progress,
//                                   ),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.error),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       comment.user!.fullName!,
//                       style: TextStyle(color: Colors.black87),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppDateUtilsHelper.formatDate(
//                             data: comment.user!.createdAt!,
//                             showTime: true,
//                           ),
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         Text(
//                           comment.description!,
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     isThreeLine: true,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         ExpansionTile(
//           title: Text('Perguntas frequentes'),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '1. Qual é o objetivo desta campanha?',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       '- Nosso objetivo é arrecadar fundos e itens para ajudar pessoas em situação de vulnerabilidade.',
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       '2. Quem está organizando esta campanha?',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       '- A campanha é organizada por um grupo de voluntários e apoiadores.',
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       '3. Para onde vai o dinheiro ou os itens arrecadados?',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       '- Todas as doações serão direcionadas para comunidades carentes e instituições beneficentes.',
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       '4. Como posso contribuir?',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       '- Você pode doar dinheiro, alimentos, roupas ou se voluntariar para ajudar na distribuição.',
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       '5. Há um valor mínimo para doação?',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       '- Não, qualquer contribuição é bem-vinda e fará a diferença!',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         ExpansionTile(
//           title: Text('Denunciar esta campanha'),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Selecione um motivo:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   DropdownButtonFormField<String>(
//                     items: [
//                       DropdownMenuItem(value: 'Fraude', child: Text('Fraude')),
//                       DropdownMenuItem(
//                         value: 'Informações falsas',
//                         child: Text('Informações falsas'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Uso indevido',
//                         child: Text('Uso indevido dos fundos'),
//                       ),
//                       DropdownMenuItem(value: 'Outro', child: Text('Outro')),
//                     ],
//                     onChanged: (value) {},
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Escolha um motivo',
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     'Descreva o problema:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   TextField(
//                     maxLines: 3,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       hintText: 'Descreva o motivo do seu relatório...',
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Aqui adicionamos a lógica para enviar o relatório
//                     },
//                     child: Text('Enviar denúncia'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Text(
//             'Para qualquer dúvida contacte o respetivo ativista',
//             style: TextStyle(fontStyle: FontStyle.italic),
//           ),
//         ),
//         SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: RichText(
//             text: TextSpan(
//               style: TextStyle(color: Colors.black, fontSize: 16),
//               children: [
//                 TextSpan(
//                   text: 'Call: ',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextSpan(
//                   text: campaign.phoneNumber,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

