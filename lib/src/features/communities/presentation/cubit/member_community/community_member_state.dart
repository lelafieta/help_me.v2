part of 'community_member_cubit.dart';

abstract class CommunityMemberState extends Equatable {
  const CommunityMemberState();

  @override
  List<Object> get props => [];
}

class CommunityMemberInitial extends CommunityMemberState {}

class CommunityMemberLoading extends CommunityMemberState {}

class CommunityMemberLoaded extends CommunityMemberState {
  final List<CommunityMemberEntity> members;

  const CommunityMemberLoaded({required this.members});

  @override
  List<Object> get props => [members];
}

class CommunityMemberFailure extends CommunityMemberState {
  final String failure;

  const CommunityMemberFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

class CommunityMemberEmpty extends CommunityMemberState {}
