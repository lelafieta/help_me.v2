
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/data/models/create_campaign_dto.dart';
import 'package:help_me/features/campaigns/data/models/update_campaign_dto.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/usecases/create_campaign_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/delete_campaign_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_all_campaigns_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_campaign_by_id_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_campaigns_by_category_id_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_campaigns_by_user_id_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_my_campaigns_by_status_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_urgent_campaigns_smart_usecase.dart';
import 'package:help_me/features/campaigns/domain/usecases/update_campaign_usecase.dart';
import 'package:dio/dio.dart';

part 'campaign_state.dart';

class CampaignCubit extends Cubit<CampaignState> {
  final CreateCampaignUseCase createCampaignUseCase;
  final GetAllCampaignsUseCase getAllCampaignsUseCase;
  final GetCampaignsByUserIdUseCase getCampaignsByUserIdUseCase;
  final GetCampaignByIdUseCase getCampaignByIdUseCase;
  final GetCampaignsByCategoryIdUseCase getCampaignsByCategoryIdUseCase;
  final GetMyCampaignsByStatusUseCase getMyCampaignsByStatusUseCase;
  final GetUrgentCampaignsSmartUseCase getUrgentCampaignsSmartUseCase;
  final UpdateCampaignUseCase updateCampaignUseCase;
  final DeleteCampaignUseCase deleteCampaignUseCase;

  CampaignCubit({
    required this.createCampaignUseCase,
    required this.getAllCampaignsUseCase,
    required this.getCampaignsByUserIdUseCase,
    required this.getCampaignByIdUseCase,
    required this.getCampaignsByCategoryIdUseCase,
    required this.getMyCampaignsByStatusUseCase,
    required this.getUrgentCampaignsSmartUseCase,
    required this.updateCampaignUseCase,
    required this.deleteCampaignUseCase,
  }) : super(CampaignInitial());

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return (failure as ServerFailure).errorMessage ?? 'Server Error';
      case CacheFailure:
        return 'Cache Error';
      case NetworkFailure:
        return (failure as NetworkFailure).errorMessage ?? 'Network Error';
      default:
        return 'Unexpected Error';
    }
  }

  Future<void> createCampaign({
    required CreateCampaignDto dto,
    required List<MultipartFile> documents,
    required List<MultipartFile> midias,
    required MultipartFile cover,
  }) async {
    emit(CampaignLoading());
    final result = await createCampaignUseCase(CreateCampaignParams(
      dto: dto,
      documents: documents,
      midias: midias,
      cover: cover,
    ));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaign) => emit(CampaignCreated(campaign: campaign)),
    );
  }

  Future<void> getAllCampaigns() async {
    emit(CampaignLoading());
    final result = await getAllCampaignsUseCase(NoParams());
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaigns) => emit(CampaignLoaded(campaigns: campaigns)),
    );
  }

  Future<void> getCampaignsByUserId(int userId) async {
    emit(CampaignLoading());
    final result = await getCampaignsByUserIdUseCase(GetCampaignsByUserIdParams(userId: userId));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaigns) => emit(CampaignLoaded(campaigns: campaigns)),
    );
  }

  Future<void> getCampaignById(int id) async {
    emit(CampaignLoading());
    final result = await getCampaignByIdUseCase(GetCampaignByIdParams(id: id));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaign) => emit(CampaignDetailLoaded(campaign: campaign)),
    );
  }

  Future<void> getCampaignsByCategoryId(int categoryId) async {
    emit(CampaignLoading());
    final result = await getCampaignsByCategoryIdUseCase(GetCampaignsByCategoryIdParams(categoryId: categoryId));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaigns) => emit(CampaignLoaded(campaigns: campaigns)),
    );
  }

  Future<void> getMyCampaignsByStatus(int userId, String status) async {
    emit(CampaignLoading());
    final result = await getMyCampaignsByStatusUseCase(GetMyCampaignsByStatusParams(userId: userId, status: status));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaigns) => emit(CampaignLoaded(campaigns: campaigns)),
    );
  }

  Future<void> getUrgentCampaignsSmart(int userId) async {
    emit(CampaignLoading());
    final result = await getUrgentCampaignsSmartUseCase(GetUrgentCampaignsSmartParams(userId: userId));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaigns) => emit(CampaignLoaded(campaigns: campaigns)),
    );
  }

  Future<void> updateCampaign(int id, UpdateCampaignDto dto) async {
    emit(CampaignLoading());
    final result = await updateCampaignUseCase(UpdateCampaignParams(id: id, dto: dto));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (campaign) => emit(CampaignUpdated(campaign: campaign)),
    );
  }

  Future<void> deleteCampaign(int id) async {
    emit(CampaignLoading());
    final result = await deleteCampaignUseCase(DeleteCampaignParams(id: id));
    result.fold(
      (failure) => emit(CampaignError(message: _mapFailureToMessage(failure))),
      (_) => emit(CampaignDeleted()),
    );
  }
}
