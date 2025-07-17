part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;

  const UserLoaded({this.firstName, this.avatarUrl, this.lastName});
}

class UserError extends UserState {
  final String message;

  const UserError({required this.message});

  @override
  List<Object> get props => [message];
}
