import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/campaign_entity.dart';
import '../../../domain/params/campaign_params.dart';
import '../../../domain/usecases/get_all_urgent_campaigns_usecase.dart';
import 'campaign_urgent_state.dart';

class CampaignUrgentCubit extends Cubit<CampaignUrgentState> {
  final GetAllUrgentCampaignsUseCase getUrgentCampaignsUseCase;
  CampaignUrgentCubit({required this.getUrgentCampaignsUseCase})
    : super(CampaignUrgentInitial());

  int page = 1;
  int limit = 10;

  Future<void> getUrgentCampaigns({
    bool isRefresh = false,
    CampaignParams? params,
  }) async {
    if (state is CampaignUrgentLoading) return;

    if (isRefresh) {
      page = 1;
      emit(CampaignUrgentInitial());
    }

    final currentState = state;
    var oldCampaigns = <CampaignEntity>[];

    if (currentState is CampaignUrgentLoaded && !isRefresh) {
      oldCampaigns = currentState.campaigns;
    }

    emit(CampaignUrgentLoading(oldCampaigns, isFirstFetch: page == 1));

    final result = await getUrgentCampaignsUseCase.call(NoParams());

    result.fold(
      (failure) =>
          emit(CampaignUrgentError(message: failure.errorMessage.toString())),
      (myCampaigns) {
        if (isRefresh) {
          oldCampaigns.clear();
        }

        if (myCampaigns.isEmpty) {
          emit(CampaignUrgentLoaded(campaigns: oldCampaigns, isLastPage: true));
        } else {
          page++;
          final campaigns = (state as CampaignUrgentLoading).oldCampaigns;
          campaigns.addAll(myCampaigns);
          emit(CampaignUrgentLoaded(campaigns: campaigns, isLastPage: false));
        }
      },
    );
  }
}
