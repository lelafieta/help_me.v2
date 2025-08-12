import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sliver_snap/sliver_snap.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/image_helper.dart';
import '../../../events/presentation/cubit/community_event/community_event_cubit.dart';
import '../../../events/presentation/widgets/event_widget.dart';
import '../../../posts/presentation/cubit/community_post_resource/community_post_resource_cubit.dart';
import '../../domain/entities/community_entity.dart';
import '../cubit/member_community/community_member_cubit.dart';

class CommunityDetailsPage extends StatefulWidget {
  final CommunityEntity community;
  const CommunityDetailsPage({super.key, required this.community});

  @override
  State<CommunityDetailsPage> createState() => _CommunityDetailsPageState();
}

class _CommunityDetailsPageState extends State<CommunityDetailsPage> {
  int pageSelectedIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<CommunityMemberCubit>().getMembersByCommunityId(
      widget.community.id,
    );
    context.read<CommunityEventCubit>().getPostsByCommunityId(
      widget.community.id,
    );
    context.read<CommunityPostResourceCubit>().getPostsByCommunityId(
      widget.community.id,
    );
  }

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
                    pageSelectedIndex = index;
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
            child: switch (pageSelectedIndex) {
              0 => AboutWidget(community: widget.community),
              1 => MemberWidget(community: widget.community),
              2 => CommunityEventWidget(community: widget.community),
              3 => GalleryWidget(community: widget.community),
              _ => SizedBox.shrink(),
            },
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

class MemberWidget extends StatelessWidget {
  final CommunityEntity community;
  const MemberWidget({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final member = community.members[index];
        return ListTile(
          leading: ClipOval(
            child: Container(
              width: 40,
              height: 40,
              color: Colors.grey.shade300,
              child: ImageHelper.showImage(member.user.avatarUrl),
            ),
          ),
          title: Text(member.user.fullName.toString()),
          subtitle: Text(member.role.toString().toLowerCase()),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: community.membersCount,
    );
  }
}

class CommunityEventWidget extends StatelessWidget {
  final CommunityEntity community;
  const CommunityEventWidget({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityEventCubit, CommunityEventState>(
      builder: (context, state) {
        if (state is CommunityEventLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CommunityEventFailure) {
          return Center(child: Text(state.failure));
        } else if (state is CommunityEventEmpty) {
          return Center(child: Text("Nenhum evento encontrado"));
        } else if (state is CommunityEventLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final event = state.events[index];
              return EventWidget(event: event);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: state.events.length,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class GalleryWidget extends StatelessWidget {
  final CommunityEntity community;
  const GalleryWidget({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityPostResourceCubit, CommunityPostResourceState>(
      builder: (context, state) {
        if (state is CommunityPostResourceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CommunityPostResourceLoaded) {
          // 🔁 Coleta todas as imagens de todos os posts
          final images = state.posts
              .expand((post) => post.resources) // ← junta todas as resources
              .where((res) => res.type == 'image') // ← filtra apenas imagens
              .toList();

          if (images.isEmpty) {
            return const Center(child: Text('Sem imagens na comunidade.'));
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final image = images[index];
              return ImageHelper.showImage(image.url);
            },
          );
        } else if (state is CommunityPostResourceFailure) {
          return Center(child: Text(state.failure));
        } else if (state is CommunityPostResourceEmpty) {
          return const Center(child: Text('Nenhuma imagem encontrada.'));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
