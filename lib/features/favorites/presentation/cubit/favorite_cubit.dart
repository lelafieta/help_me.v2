import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_all_favorites_usecase.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetAllFavoritesByUseCase getAllFavoritesByUseCase;

  FavoriteCubit({required this.getAllFavoritesByUseCase})
    : super(FavoriteInitial());

  Future<void> getAllFavorites() async {
    emit(FavoriteLoading());
    // final response = getAllFavoritesByUseCase(NoParams());
  }
}
