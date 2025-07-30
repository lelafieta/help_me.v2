part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorites;
  const FavoriteLoaded({required this.favorites});

  @override
  List<Object?> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String error;
  const FavoriteError({required this.error});

  @override
  List<Object?> get props => [error];
}
