part of 'user_local_data_cubit.dart';

abstract class UserLocalDataState extends Equatable {
  const UserLocalDataState();

  @override
  List<Object> get props => [];
}

class UserLocalDataInitial extends UserLocalDataState {}

class UserLocalDataLoading extends UserLocalDataState {}

class UserLocalDataLoaded extends UserLocalDataState {
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;

  const UserLocalDataLoaded({this.firstName, this.avatarUrl, this.lastName});

  @override
  List<Object> get props => [firstName!, lastName!, avatarUrl!];
}

class UserLocalDataError extends UserLocalDataState {
  final String message;

  const UserLocalDataError({required this.message});

  @override
  List<Object> get props => [message];
}
