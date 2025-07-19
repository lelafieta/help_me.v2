import '../../domain/repositories/i_donation_respository.dart';
import '../datasources/i_donation_remote_datasource.dart';

class DonationRepository extends IDonationRepository {
  final IDonationRemoteDataSource dotationDataSource;

  DonationRepository({required this.dotationDataSource});
  @override
  Future<int> getCountMyDonations() {
    return dotationDataSource.getCountMyDonations();
  }
}
