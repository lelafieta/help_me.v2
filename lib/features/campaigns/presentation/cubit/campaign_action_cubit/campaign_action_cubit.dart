import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/campaign_entity.dart';
import '../../../domain/usecases/create_campaign_usecase.dart';
import '../../../domain/usecases/update_campaign_usecase.dart';

part 'campaign_action_state.dart';

class CampaignActionCubit extends Cubit<CampaignActionState> {
  final CreateCampaignUseCase createCampaignUseCase;
  final UpdateCampaignUseCase updateCampaignUseCase;

  CampaignActionCubit({
    required this.createCampaignUseCase,
    required this.updateCampaignUseCase,
  }) : super(CampaignActionInitial());

  Future<void> create(CreateCampaignParams params) async {
    emit(CampaignActionLoading());
    final result = await createCampaignUseCase.call(params);

    result.fold(
      (failure) => emit(CampaignActionError(message: failure.toString())),
      (success) => emit(CampaignActionSuccess()),
    );
  }

  Future<void> update(UpdateCampaignParams params) async {
    emit(CampaignActionLoading());
    final result = await updateCampaignUseCase.call(params);

    result.fold(
      (failure) =>
          emit(CampaignActionError(message: failure.errorMessage.toString())),
      (success) => emit(CampaignActionSuccess()),
    );
  }
}
