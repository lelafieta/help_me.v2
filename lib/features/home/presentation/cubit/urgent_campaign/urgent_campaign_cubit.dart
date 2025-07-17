import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/features/campaigns/domain/usecases/get_urgent_campaigns_smart_usecase.dart';

import '../../../../campaigns/domain/entities/campaign_entity.dart';

part 'urgent_campaign_state.dart';

class UrgentCampaignCubit extends Cubit<UrgentCampaignState> {
  final GetUrgentCampaignsSmartUseCase getUrgentCampaignsSmartUseCase;

  UrgentCampaignCubit({required this.getUrgentCampaignsSmartUseCase})
    : super(UrgentCampaignInitial());

  Future<void> fetchUrgentCampaigns() async {
    emit(UrgentCampaignLoading());
    final result = await getUrgentCampaignsSmartUseCase(
      GetUrgentCampaignsSmartParams(userId: 1),
    );
    result.fold(
      (failure) =>
          emit(UrgentCampaignError(message: failure.errorMessage.toString())),
      (campaigns) => emit(UrgentCampaignLoaded(campaigns: campaigns)),
    );
  }
}
