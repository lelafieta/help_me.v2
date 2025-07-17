part of 'solidary_cubit.dart';

abstract class SolidaryState extends Equatable {
  const SolidaryState();

  @override
  List<Object> get props => [];
}

class SolidaryInitial extends SolidaryState {}

class SolidaryLoading extends SolidaryState {}

class SolidaryLoaded extends SolidaryState {
  final String message;

  const SolidaryLoaded({required this.message});

  @override
  List<Object> get props => [message];
}

class SolidaryError extends SolidaryState {
  final String message;

  const SolidaryError({required this.message});

  @override
  List<Object> get props => [message];
}
