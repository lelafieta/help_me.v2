import 'package:bloc/bloc.dart';
import 'package:help_me/core/usecases/usecase.dart';
import '../../../domain/entities/campaign_entity.dart';
import '../../../domain/params/campaign_params.dart';
import '../../../domain/usecases/get_all_my_campaigns_usecase.dart';
import 'my_campaign_state.dart';

class MyCampaignCubit extends Cubit<MyCampaignState> {
  final GetAllMyCampaignsUseCase getAllMyCampaignsUseCase;

  MyCampaignCubit({required this.getAllMyCampaignsUseCase})
    : super(MyCampaignInitial());

  int page = 1;
  int limit = 10;
  Future<void> getAllMyCamapigns({
    bool isRefresh = false,
    CampaignParams? params,
  }) async {
    if (state is MyCampaignLoading) return;

    if (isRefresh) {
      page = 1;
      emit(MyCampaignInitial());
    }

    final currentState = state;
    var oldCampaigns = <CampaignEntity>[];

    if (currentState is MyCampaignLoaded && !isRefresh) {
      oldCampaigns = currentState.campaigns;
    }

    emit(MyCampaignLoading(oldCampaigns, isFirstFetch: page == 1));

    final result = await getAllMyCampaignsUseCase.call(NoParams());

    result.fold(
      (failure) =>
          emit(MyCampaignError(message: failure.errorMessage.toString())),
      (myCampaigns) {
        if (isRefresh) {
          oldCampaigns.clear();
        }

        if (myCampaigns.isEmpty) {
          emit(MyCampaignLoaded(campaigns: oldCampaigns, isLastPage: true));
        } else {
          page++;
          final campaigns = (state as MyCampaignLoading).oldCampaigns;
          campaigns.addAll(myCampaigns);
          emit(MyCampaignLoaded(campaigns: campaigns, isLastPage: false));
        }
      },
    );
  }
}
