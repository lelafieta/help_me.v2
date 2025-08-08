import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/campaign_entity.dart';
import '../../../domain/usecases/get_all_my_campaigns_usecase.dart';
part 'my_campaign_state.dart';

class MyCampaignCubit extends Cubit<MyCampaignState> {
  final GetAllMyCampaignsUseCase getAllMyCampaignsUseCase;

  MyCampaignCubit({required this.getAllMyCampaignsUseCase})
    : super(MyCampaignInitial());

  Future<void> getAllMyCamapigns({String? status}) async {
    emit(MyCampaignLoading());
    final result = await getAllMyCampaignsUseCase(status);
    result.fold(
      (failure) {
        emit(MyCampaignFailure(failure: failure.errorMessage.toString()));
      },
      (campaigns) {
        if (campaigns.isEmpty) {
          emit(MyCampaignEmpty());
        } else {
          emit(MyCampaignLoaded(campaigns: campaigns));
        }
      },
    );
  }
}
