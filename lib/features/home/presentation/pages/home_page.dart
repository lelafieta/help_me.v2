import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_me/features/categories/presentation/cubit/category_cubit.dart';

import '../../../../core/resources/icons/app_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';

import 'package:flutter/material.dart';

import '../widgets/category_skeleton.dart';

class Category {
  final String name;
  final Color? color;
  final String? iconPath;

  Category({required this.name, this.color, this.iconPath});
}

final List<Category> allCategories = [
  Category(
    name: 'Médico',
    color: Colors.lightBlue, // Azul-claro: confiança, saúde, tranquilidade
    iconPath: Assets.svg.medicine.path,
  ),
  Category(
    name: 'Saúde',
    color: Colors.pinkAccent, // Rosa vibrante: bem-estar, vitalidade
    iconPath: Assets.svg.old.path,
  ),
  Category(
    name: 'Meio Ambiente',
    color: Colors.teal, // Verde-azulado: natureza, frescor, ecologia
    iconPath: Assets.svg.education.path,
  ),
  Category(
    name: 'Olfã',
    color:
        Colors.deepOrangeAccent, // Laranja vibrante: solidariedade, acolhimento
    iconPath: Assets.svg.group.path,
  ),
  Category(
    name: 'Animal',
    color: Colors.amber, // Amarelo suave: carinho, vida, cuidado
    iconPath: Assets.svg.animal.path,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.svg.menu.path, width: 24),
                ),

                Row(
                  children: [
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state is UserLoaded) {
                          return Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.svg.notificationBellOutline.path,
                                    width: 30,
                                  ),
                                  SizedBox(width: 8),
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage(
                                      state.avatarUrl!,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                ],
                              ),
                            ],
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              children: [
                BlocBuilder<UserCubit, UserState>(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return CategorySkeleton();
                } else if (state is CategoryLoaded) {
                  final categories = state.categories;
                  // Adiciona o item "Todos" antes dos demais
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SvgPicture.asset(
                                Assets.svg.categoryAlt.path,
                                width: 25,
                                height: 25,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Todos',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(categories.length, (index) {
                        final category = categories[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == categories.length - 1 ? 0 : 12,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: allCategories[index].color!
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  allCategories[index].iconPath!,
                                  width: 25,
                                  height: 25,
                                  color: allCategories[index].color,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                category.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
