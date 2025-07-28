import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/get_all_categories_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetAllCategoriesUsecase getAllCategoriesUsecase;
  CategoryCubit({required this.getAllCategoriesUsecase})
    : super(CategoryInitial());

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    final result = await getAllCategoriesUsecase(NoParams());
    result.fold(
      (failure) {
        emit(CategoryError(error: failure.errorMessage.toString()));
      },
      (categories) {
        emit(CategoryLoaded(categories: categories));
      },
    );
  }
}
