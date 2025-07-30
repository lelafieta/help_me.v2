import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../../favorites/domain/entities/favorite_entity.dart';
import '../../../../favorites/domain/params/favorite_params.dart';
import '../../../../favorites/domain/usecases/add_favorite_usecase.dart';
import '../../../../favorites/domain/usecases/get_all_favorites_usecase.dart';
import '../../../../favorites/domain/usecases/get_favorites_by_type_usecase.dart';
import '../../../../favorites/domain/usecases/is_my_favorite_usecase.dart';
import '../../../../favorites/domain/usecases/remove_favorite_usecase.dart';

enum CampaignStoreFavoriteState { initial, loading, success, error }

class CampaignStoreFavoriteCubit extends Cubit<CampaignStoreFavoriteState> {
  final AddFavoriteUseCase addFavoriteUsecase;
  final RemoveFavoriteUseCase removeFavoriteUsecase;
  final IsMyFavoriteUseCase isMyFavoriteUsecase;
  final GetAllFavoritesUseCase getAllFavoritesUsecase;
  final GetFavoritesByTypeUseCase getFavoritesByTypeUseCase;
  CampaignStoreFavoriteCubit({
    required this.addFavoriteUsecase,
    required this.removeFavoriteUsecase,
    required this.isMyFavoriteUsecase,
    required this.getAllFavoritesUsecase,
    required this.getFavoritesByTypeUseCase,
  }) : super(CampaignStoreFavoriteState.initial);

  Future<void> addFavorite(FavoriteEntity favorite) async {
    // emit(CampaignStoreFavoriteState.loading);

    // final response = await addFavoriteUseCase.call(favorite);

    // response.fold((l) => emit(CampaignStoreFavoriteState.error),
    //     (r) => emit(CampaignStoreFavoriteState.success));
  }

  Future<void> removeFavorite(FavoriteEntity params) async {
    // emit(CampaignStoreFavoriteState.loading);

    // final response = await removeFavoriteUseCase.call(params);

    // response.fold((l) => emit(CampaignStoreFavoriteState.error),
    //     (r) => emit(CampaignStoreFavoriteState.success));
  }

  Future<void> loadFavorites() async {
    emit(CampaignStoreFavoriteState.loading);
    final result = await getAllFavoritesUsecase(NoParams());

    result.fold(
      (failure) => emit(CampaignStoreFavoriteState.error),
      (favorites) => emit(CampaignStoreFavoriteState.success),
    );
  }

  Future<void> toggleFavorite({
    required String itemId,
    required String itemType,
    required bool state,
  }) async {
    emit(CampaignStoreFavoriteState.loading);

    final isFavResult = await isMyFavoriteUsecase(itemId);
    isFavResult.fold((failure) => emit(CampaignStoreFavoriteState.error), (
      isFav,
    ) async {
      final dto = FavoriteParams(itemId: itemId, itemType: itemType);

      final result = isFav
          ? await removeFavoriteUsecase(dto)
          : await addFavoriteUsecase(dto);

      result.fold(
        (failure) => emit(CampaignStoreFavoriteState.error),
        (_) => loadFavorites(),
      );
    });
  }
}
