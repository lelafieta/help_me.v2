import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_campaign_by_id_usecase.dart';
import 'my_campaign_detail_state.dart';

class MyCampaignDetailCubit extends Cubit<MyCampaignDetailState> {
  final GetCampaignByIdUseCase getMyCampaignByIdUseCase;
  MyCampaignDetailCubit({required this.getMyCampaignByIdUseCase})
    : super(MyCampaignDetailInitial());

  Future<void> getMyCampaignById(String id) async {
    emit(MyCampaignDetailLoading());

    final result = await getMyCampaignByIdUseCase.call(
      GetCampaignByIdParams(id: 1),
    );

    result.fold(
      (failure) =>
          emit(MyCampaignDetailError(message: failure.errorMessage.toString())),
      (campaign) => emit(MyCampaignDetailLoaded(campaign: campaign)),
    );
  }
}
