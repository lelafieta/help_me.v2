import 'package:dio/dio.dart';

import 'i_donation_remote_datasource.dart';

class DonationRemoteDataSource extends IDonationRemoteDataSource {
  final Dio dio;

  DonationRemoteDataSource({required this.dio});

  @override
  Future<int> getCountMyDonations() {
    throw UnimplementedError();
  }
}
