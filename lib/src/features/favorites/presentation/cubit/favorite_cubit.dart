import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utueji/src/features/favorites/domain/usecases/get_favorites_by_type_usecase.dart';
import '../../../../core/entities/no_params.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/params/favorite_params.dart';
import '../../domain/usecases/add_favorite_usecase.dart';
import '../../domain/usecases/get_all_favorites_usecase.dart';
import '../../domain/usecases/is_my_favorite_usecase.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final AddFavoriteUseCase addFavoriteUsecase;
  final RemoveFavoriteUseCase removeFavoriteUsecase;
  final IsMyFavoriteUseCase isMyFavoriteUsecase;
  final GetAllFavoritesUseCase getAllFavoritesUsecase;
  final GetFavoritesByTypeUseCase getFavoritesByTypeUseCase;

  FavoriteCubit({
    required this.addFavoriteUsecase,
    required this.removeFavoriteUsecase,
    required this.isMyFavoriteUsecase,
    required this.getAllFavoritesUsecase,
    required this.getFavoritesByTypeUseCase,
  }) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    final result = await getAllFavoritesUsecase(NoParams());

    result.fold(
      (failure) => emit(FavoriteError(error: failure.errorMessage.toString())),
      (favorites) => emit(FavoriteLoaded(favorites: favorites)),
    );
  }

  Future<void> toggleFavorite({
    required String itemId,
    required String itemType,
  }) async {
    emit(FavoriteLoading());

    final isFavResult = await isMyFavoriteUsecase(itemId);
    isFavResult.fold(
      (failure) => emit(FavoriteError(error: failure.errorMessage.toString())),
      (isFav) async {
        final dto = FavoriteParams(itemId: itemId, itemType: itemType);

        final result = isFav
            ? await removeFavoriteUsecase(dto)
            : await addFavoriteUsecase(dto);

        result.fold(
          (failure) =>
              emit(FavoriteError(error: failure.errorMessage.toString())),
          (_) => loadFavorites(),
        );
      },
    );
  }
}
