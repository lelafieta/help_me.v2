// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../../config/themes/app_colors.dart';
// import '../../../../core/utils/app_utils.dart';
// import '../../../../gen/assets.gen.dart';
// import '../../domain/entities/campaign_entity.dart';

// class CampaignWidget extends StatelessWidget {
//   final CampaignEntity campaign;
//   const CampaignWidget({super.key, required this.campaign});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       margin: EdgeInsets.only(right: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(width: 0.5, color: Colors.black26),
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Stack(
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     child: CachedNetworkImage(
//                       imageUrl:
//                           "http://10.0.2.2:3000/uploads/campaign_midias/1752177329834-869610841.jpg",
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => const Center(
//                         child: SizedBox(
//                           width: 40,
//                           height: 40,
//                           child: CircularProgressIndicator(),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) =>
//                           const Icon(Icons.error),
//                     ),
//                   ),

//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     top: 0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             // ignore: deprecated_member_use
//                             AppColors.blue.withOpacity(.4),
//                             // ignore: deprecated_member_use
//                             AppColors.primaryColor.withOpacity(.4),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   (campaign != 0)
//                       ? const SizedBox.shrink()
//                       : Positioned(
//                           left: 10,
//                           top: 10,
//                           child: Container(
//                             width: 120,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: const LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(255, 110, 32, 27),
//                                   Color.fromARGB(255, 248, 101, 99),
//                                 ],
//                               ),
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 "EMERGÊNCIA",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                   // Positioned(
//                   //   right: 5,
//                   //   top: 5,
//                   //   child: ClipRRect(
//                   //     borderRadius: BorderRadius.circular(50),
//                   //     child: AppUtils.favoriteWidget(
//                   //       context: context,
//                   //       itemId: campaign.id!,
//                   //       itemType: "campaign",
//                   //     ),
//                   //   ), //
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 10),
//                 Text(
//                   campaign.title!,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//                 const SizedBox(height: 15),
//                 // ListTile(
//                 //   contentPadding: EdgeInsets.all(0),
//                 //   horizontalTitleGap: 0,
//                 //   leading: Container(
//                 //     width: 30,
//                 //     height: 30,
//                 //     decoration: BoxDecoration(
//                 //       color: Colors.black12,
//                 //       borderRadius: BorderRadius.circular(100),
//                 //     ),
//                 //   ),
//                 //   title: Text(
//                 //     "Lela Fieta",
//                 //     style: TextStyle(color: Colors.grey.shade700),
//                 //   ),
//                 // ),
//                 RichText(
//                   text: TextSpan(
//                     style: DefaultTextStyle.of(context).style,
//                     children: [
//                       TextSpan(
//                         text: AppUtils.formatCurrency(
//                           campaign.fundraisingGoal!,
//                         ),
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const TextSpan(text: " / "),
//                       TextSpan(
//                         text: AppUtils.formatCurrency(
//                           campaign.fundraisingGoal!,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Stack(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 15,
//                       decoration: BoxDecoration(
//                         color: AppColors.strokeColor,
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     Positioned(
//                       child: FAProgressBar(
//                         currentValue: AppUtils.calculateFundraisingPercentage(
//                           campaign.fundsRaised,
//                           campaign.fundraisingGoal,
//                         ),
//                         backgroundColor: AppColors.strokeColor,
//                         progressColor: Colors.black,
//                         changeProgressColor: Colors.red,
//                         size: 15,
//                         displayTextStyle: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 10,
//                           color: Colors.white,
//                         ),
//                         displayText: '%',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: 25,
//                         child: Stack(
//                           children: [
//                             ...() {
//                               final contributors =
//                                   campaign.campaignContributors ?? [];
//                               final avatarsToShow = contributors
//                                   .take(3)
//                                   .toList();
//                               List<Widget> avatarWidgets = [];

//                               for (int i = 0; i < avatarsToShow.length; i++) {
//                                 avatarWidgets.add(
//                                   Positioned(
//                                     left: i * 10.0,
//                                     top: 0,
//                                     child: Container(
//                                       width: 25,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                           color: Theme.of(
//                                             context,
//                                           ).scaffoldBackgroundColor,
//                                           width: 2,
//                                         ),
//                                         image: DecorationImage(
//                                           image:
//                                               avatarsToShow[i].user.avatarUrl !=
//                                                   null
//                                               ? NetworkImage(
//                                                   avatarsToShow[i]
//                                                       .user
//                                                       .avatarUrl,
//                                                 )
//                                               : AssetImage(
//                                                       'assets/images/default_avatar.png',
//                                                     )
//                                                     as ImageProvider,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }

//                               return avatarWidgets;
//                             }(),

//                             // Texto ao lado dos círculos
//                             Positioned.fill(
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                     left: () {
//                                       final count =
//                                           (campaign
//                                               .campaignContributors
//                                               ?.length ??
//                                           0);
//                                       final max = count > 3 ? 3 : count;
//                                       return max * 5.0 + 25;
//                                     }(),
//                                   ),
//                                   child: RichText(
//                                     text: TextSpan(
//                                       style: DefaultTextStyle.of(context).style,
//                                       children: () {
//                                         final contributors =
//                                             campaign.campaignContributors;
//                                         final count = contributors?.length ?? 0;

//                                         if (count == 0) {
//                                           return [
//                                             const TextSpan(
//                                               text: "Nenhum doador",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ];
//                                         } else if (count == 1) {
//                                           return [
//                                             const TextSpan(
//                                               text: "1 Doador",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ];
//                                         } else if (count == 2) {
//                                           return [
//                                             const TextSpan(
//                                               text: "2 Doadores",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ];
//                                         } else if (count == 3) {
//                                           return [
//                                             const TextSpan(
//                                               text: "3 Doadores",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ];
//                                         } else {
//                                           return [
//                                             TextSpan(
//                                               text:
//                                                   "+ ${AppUtils.formatNumber(count)} Doadores",
//                                               style: const TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ];
//                                         }
//                                       }(),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SvgPicture.asset(
//                           Assets.svg.clock.path,
//                           width: 16,
//                           height: 16,
//                         ),
//                         const SizedBox(width: 5),
//                         (AppUtils.daysRemainingUntil(campaign.endDate!) == 0)
//                             ? const Text(
//                                 "Está acontecer",
//                                 style: TextStyle(fontSize: 12),
//                               )
//                             : (AppUtils.daysRemainingUntil(campaign.endDate!) <
//                                   0)
//                             ? Text(
//                                 AppUtils.formatDate(data: campaign.endDate!),
//                                 style: const TextStyle(fontSize: 12),
//                               )
//                             : Text(
//                                 "${AppUtils.daysRemainingUntil(campaign.endDate!)}d rest.",
//                                 style: const TextStyle(fontSize: 12),
//                               ),
//                       ],
//                     ),
//                   ],
//                 ),

//                 // Row(
//                 //   children: [
//                 //     Stack(
//                 //       children: [
//                 //         Positioned(
//                 //           child: Container(
//                 //             width: 20,
//                 //             height: 20,
//                 //             decoration: BoxDecoration(
//                 //               color: Colors.red,
//                 //               borderRadius: BorderRadius.circular(100),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //         Positioned(
//                 //           left: 10,
//                 //           child: Container(
//                 //             width: 20,
//                 //             height: 20,
//                 //             decoration: BoxDecoration(
//                 //               color: Colors.green,
//                 //               borderRadius: BorderRadius.circular(100),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //         Positioned(
//                 //           left: 20,
//                 //           child: Container(
//                 //             width: 20,
//                 //             height: 20,
//                 //             decoration: BoxDecoration(
//                 //               color: Colors.yellow,
//                 //               borderRadius: BorderRadius.circular(100),
//                 //             ),
//                 //             child: Center(child: Text("+9")),
//                 //           ),
//                 //         ),
//                 //         Positioned(
//                 //           left: 50,
//                 //           top: 2.5,
//                 //           child: Center(
//                 //             child: Text(
//                 //               "Pessoas Contribuiram",
//                 //               style: TextStyle(
//                 //                 fontSize: 12,
//                 //                 color: Colors.black,
//                 //               ),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //         Container(width: 200, color: Colors.amber),
//                 //       ],
//                 //     ),
//                 //     Expanded(
//                 // child: Row(
//                 //   mainAxisAlignment: MainAxisAlignment.end,
//                 //   children: [
//                 //     SvgPicture.asset(
//                 //       Assets.svg.clock.path,
//                 //       width: 16,
//                 //       height: 16,
//                 //     ),
//                 //     SizedBox(width: 5),
//                 //     (AppUtils.daysRemainingUntil(campaign.endDate!) == 0)
//                 //         ? Text(
//                 //             "Está acontecer",
//                 //             style: const TextStyle(fontSize: 12),
//                 //           )
//                 //         : (AppUtils.daysRemainingUntil(
//                 //                 campaign.endDate!,
//                 //               ) <
//                 //               0)
//                 //         ? Text(
//                 //             AppUtils.formatDate(data: campaign.endDate!),
//                 //             style: const TextStyle(fontSize: 12),
//                 //           )
//                 //         : Text(
//                 //             "Faltando ${AppUtils.daysRemainingUntil(campaign.endDate!)} dias",
//                 //             style: const TextStyle(fontSize: 12),
//                 //           ),
//                 //   ],
//                 // ),
//                 //     ),
//                 //   ],
//                 // ), // Container(
//                 // //   child: Row(
//                 //     children: [
//                 //       Expanded(
//                 //         child: InkWell(
//                 //           onTap: () {
//                 //             AppUtils.contributorUsers(
//                 //               context,
//                 //               campaign.contributors!,
//                 //             );
//                 //           },
//                 //           child: Row(
//                 //             children: [
//                 //               AppUtils.contributores(
//                 //                 campaign.contributors!,
//                 //               ),
//                 //             ],
//                 //           ),
//                 //         ),
//                 //       ),
//                 //       const Icon(Icons.timelapse_rounded, size: 16),
//                 //       const SizedBox(width: 5),
//                 //       (AppUtils.daysRemainingUntil(
//                 //                 campaign.endDate!,
//                 //               ) ==
//                 //               0)
//                 //           ? Text(
//                 //               "Está acontecer",
//                 //               style: const TextStyle(fontSize: 12),
//                 //             )
//                 //           : (AppUtils.daysRemainingUntil(
//                 //                   campaign.endDate!,
//                 //                 ) <
//                 //                 0)
//                 //           ? Text(
//                 //               AppUtils.formatDate(
//                 //                 data: campaign.endDate!,
//                 //               ),
//                 //               style: const TextStyle(fontSize: 12),
//                 //             )
//                 //           : Text(
//                 //               "Faltando ${AppUtils.daysRemainingUntil(campaign.endDate!)} dias",
//                 //               style: const TextStyle(fontSize: 12),
//                 //             ),
//                 //     ],
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Color getColorByIndex(int index) {
//     switch (index) {
//       case 0:
//         return Colors.black;
//       case 1:
//         return Colors.red;
//       case 2:
//         return Colors.green;
//       default:
//         return AppColors.primaryColor;
//     }
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../config/router/app_router.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_date_utils_helper.dart';
import '../../../../core/utils/app_functions_utils_helper.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/campaign_entity.dart';

class CampaignWidget extends StatelessWidget {
  final CampaignEntity campaign;
  const CampaignWidget({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: Colors.black26),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRouter.campaignDetail, arguments: campaign);
        },
        child: Column(
          children: [
            SizedBox(
              width: 400,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 190,
                          child: (campaign.imageCoverUrl == null)
                              ? Image.asset(
                                  Assets.images.coverBackground.path,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: campaign.imageCoverUrl!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.blue.withOpacity(.4),
                                  AppColors.primaryColor.withOpacity(.4),
                                ],
                              ),
                            ),
                          ),
                        ),
                        (campaign.urgencyScore != 0)
                            ? const SizedBox.shrink()
                            : Positioned(
                                left: 10,
                                top: 10,
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 110, 32, 27),
                                        Color.fromARGB(255, 248, 101, 99),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "EMERGÊNCIA",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: AppUtils.favoriteWidget(
                              context: context,
                              itemId: campaign.id!,
                              itemType: "campaign",
                            ),
                          ), //
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          campaign.title!,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: AppUtils.formatCurrency(
                                  campaign.fundsRaised!,
                                ),
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                              ),
                              const TextSpan(text: " / "),
                              TextSpan(
                                text: AppUtils.formatCurrency(
                                  campaign.fundraisingGoal!,
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
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Positioned(
                              child: FAProgressBar(
                                currentValue:
                                    AppFuncionsUtilsHelper.calculateFundraisingPercentage(
                                      campaign.fundsRaised,
                                      campaign.fundraisingGoal,
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
                                      campaign.campaignContributors!,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      AppUtils.contributores(
                                        campaign.campaignContributors!,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(Icons.timelapse_rounded, size: 16),
                              const SizedBox(width: 5),
                              (AppDateUtilsHelper.daysRemainingUntil(
                                        campaign.endDate!,
                                      ) ==
                                      0)
                                  ? Text(
                                      "Está acontecer",
                                      style: const TextStyle(fontSize: 12),
                                    )
                                  : (AppDateUtilsHelper.daysRemainingUntil(
                                          campaign.endDate!,
                                        ) <
                                        0)
                                  ? Text(
                                      AppDateUtilsHelper.formatDate(
                                        data: campaign.endDate!,
                                      ),
                                      style: const TextStyle(fontSize: 12),
                                    )
                                  : Text(
                                      "Faltando ${AppDateUtilsHelper.daysRemainingUntil(campaign.endDate!)} dias",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppValues.s10,
                                ), // Define o raio da borda aqui
                              ),
                            ),
                      ),
                      onPressed: () {},
                      child: Text("Doar"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorByIndex(int index) {
    switch (index) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.red;
      case 2:
        return Colors.green;
      default:
        return AppColors.primaryColor;
    }
  }
}
