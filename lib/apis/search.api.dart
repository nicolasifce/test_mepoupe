import 'package:test_mepoupe/models/cep.model.dart';

import '../shared/services/dio/dio.dart';

class SearchApi {
  final DioService _dio = DioService();

  Future<CepModel> getSearch({required String cep}) async {
    try {
      final response = await _dio.get('$cep/json');
      return CepModel.fromJson(response.data);
    } on NoInternetConnectionException {
      rethrow;
    } on BadRequestException {
      rethrow;
    } on NotFoundException {
      rethrow;
    } on DeadlineExceededException {
      rethrow;
    } catch (e) {
      throw ("Tivemos um problema por favor tente novamente");
    }
  }
}
