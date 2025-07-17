part of 'count_donation_cubit.dart';

abstract class CountDonationState extends Equatable {
  const CountDonationState();

  @override
  List<Object> get props => [];
}

class CountDonationInitial extends CountDonationState {}

class CountDonationLoading extends CountDonationState {}

class CountDonationLoaded extends CountDonationState {
  final int count;

  const CountDonationLoaded({required this.count});

  @override
  List<Object> get props => [count];
}

class CountDonationError extends CountDonationState {
  final String message;

  const CountDonationError({required this.message});

  @override
  List<Object> get props => [message];
}
