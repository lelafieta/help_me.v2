import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/icons/app_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              children: [
                SafeArea(
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        return Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Olá! ${state.firstName} ${state.firstName}",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),

                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  Assets.svg.clappingHands.path,
                                  width: 16,
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (state is UserLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is UserError) {
                        return Text('Erro: ${state.message}');
                      }
                      return const Text('Home Page');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              "Sua mudança torna algumas vidas melhores",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquise campanhas, caridades...",
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    Assets.icons.search.path,
                    width: 14,
                    color: Colors.grey,
                  ),
                ),
                // suffixIcon: Container(
                //   padding: const EdgeInsets.all(12),
                //   child: SvgPicture.asset(
                //     AppIcons.microphone,
                //     width: 14,
                //     color: Colors.grey,
                //   ),
                // ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Container(
          //   height: 120,
          //   padding: EdgeInsets.symmetric(vertical: 16.0),
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     itemCount: categories.length,
          //     separatorBuilder: (_, __) => const SizedBox(width: 12),
          //     itemBuilder: (context, index) {
          //       final category = categories[index];
          //       return Column(
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.all(12),
          //             width: 50,
          //             height: 50,
          //             decoration: BoxDecoration(
          //               color: category.color!.withOpacity(0.1),
          //               borderRadius: BorderRadius.circular(16),
          //             ),
          //             child: SvgPicture.asset(
          //               category.iconPath!,
          //               width: 25,
          //               height: 25,
          //               color: category.color,
          //             ),
          //           ),
          //           const SizedBox(height: 8),
          //           Text(
          //             category.name!,
          //             style: const TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
