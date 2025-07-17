import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/categories/domain/entities/category.dart';
import 'package:help_me/features/categories/domain/usecases/get_categories_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryCubit({required this.getCategoriesUseCase})
    : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final failureOrCategories = await getCategoriesUseCase(NoParams());
    failureOrCategories.fold(
      (failure) =>
          emit(CategoryError(message: failure.errorMessage.toString())),
      (categories) => emit(CategoryLoaded(categories: categories)),
    );
  }
}
