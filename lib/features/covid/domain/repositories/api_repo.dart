import 'package:covid_tracking_using_bloc_with_test/features/covid/data/models/covide_model.dart';

import '../usecases/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
