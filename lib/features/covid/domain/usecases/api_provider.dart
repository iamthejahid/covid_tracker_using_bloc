import 'package:covid_tracking_using_bloc_with_test/features/covid/data/models/covide_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ApiProvider extends Equatable {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

  @override
  List<Object?> get props => [_dio, _url];
}
