import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_campaign_by_id_usecase.dart';
import 'campaign_detail_state.dart';

class CampaignDetailCubit extends Cubit<CampaignDetailState> {
  final GetCampaignByIdUseCase getCampaignByIdUseCase;
  CampaignDetailCubit({required this.getCampaignByIdUseCase})
    : super(CampaignDetailInitial());

  Future<void> getCampaignById(GetCampaignByIdParams id) async {
    emit(CampaignDetailLoading());

    final result = await getCampaignByIdUseCase.call(id);

    result.fold(
      (failure) =>
          emit(CampaignDetailError(message: failure.errorMessage.toString())),
      (campaign) => emit(CampaignDetailLoaded(campaign: campaign)),
    );
  }
}
