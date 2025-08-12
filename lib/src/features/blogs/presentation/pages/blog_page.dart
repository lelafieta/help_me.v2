import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:utueji/core/gen/assets.gen.dart';
import 'package:utueji/src/core/utils/app_date_utils_helper.dart';
import 'package:utueji/src/core/utils/image_helper.dart';
import '../cubit/blog_featured/blog_featured_cubit.dart';
import '../cubit/blog_for_you/blog_for_you_cubit.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogFeaturedCubit>().getFeaturedBlogs();
    context.read<BlogForYouCubit>().getForYouBlogs();
  }

  String formatarDataPersonalizada(DateTime data) {
    String diaSemana = DateFormat.EEEE('pt_BR').format(data); // Sábado
    String dia = DateFormat.d().format(data); // 11
    String mes = DateFormat.MMMM('pt_BR').format(data); // Abril
    String horaMinuto = DateFormat('HH:mm').format(data); // 10:35

    return '$diaSemana, $dia $mes $horaMinuto';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Destaques",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // TextButton(onPressed: () {}, child: Text("Ver mais"))
              ],
            ),
          ),
          BlocBuilder<BlogFeaturedCubit, BlogFeaturedState>(
            builder: (context, state) {
              if (state is BlogFeaturedLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BlogFeaturedLoaded) {
                if (state.blogs.isEmpty) {
                  return const Center(child: Text("Sem blogs"));
                }
                final blogs = state.blogs;
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    enableInfiniteScroll: false,
                    padEnds: false,
                    viewportFraction: 0.93,
                  ),
                  carouselController: CarouselSliderController(),
                  items: blogs.map((blog) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 16, top: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(height: 150),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      child: Container(
                                        height: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                        ),
                                        // child: Image.asset(
                                        //   AppImages.image1,
                                        //   fit: BoxFit.cover,
                                        // ),
                                        child: ImageHelper.showImage(
                                          blog.image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 25,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.blue,
                                        child: ImageHelper.showImage(
                                          blog.user!.avatarUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Publicado aos ${AppDateUtilsHelper.formatDate(data: blog.createdAt)}",
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        blog.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Para ti", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          BlocBuilder<BlogForYouCubit, BlogForYouState>(
            builder: (context, state) {
              if (state is BlogForYouLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BlogForYouFailure) {
                return Center(child: Text(state.failure));
              } else if (state is BlogForYouLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final blog = state.blogs[index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      // height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.grey.shade300,
                              child: ImageHelper.showImage(blog.image),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    blog.title,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Publicado aos ${AppDateUtilsHelper.formatDate(data: blog.createdAt)}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              Assets.icons.heartBold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: state.blogs.length,
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
