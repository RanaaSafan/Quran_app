import 'package:dio/dio.dart';

// main(){
//   ApiService api=ApiService(dio: Dio());
//   api.getHadith();
// }
class ApiService {
  final Dio _dio;
  final String baseUrl = "https://api.alquran.cloud/v1";

  ApiService({
    required Dio dio,
  }) : _dio = dio;


  Future<Map<String, dynamic>> get({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await _dio.get(
        "$baseUrl$endPoints",
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      String errorMessage = _extractErrorMessage(e);
      print('GET request to $endPoints failed: ${e.response
          ?.statusCode} - $errorMessage');
      throw Exception(errorMessage);
    }
  }

  Future<Map<String, dynamic>> getHadith() async {
    try {
      Response response = await _dio.get(
          'https://api.hadith.gading.dev/books'
      );
      return response.data;
    } on DioException catch (e) {
      String errorMessage = _extractErrorMessage(e);
      throw Exception(errorMessage);
    }
  }

  Future<Map<String, dynamic>> getHadithBySheikh(String name) async {
    try {
      Response response = await _dio.get(
          'https://api.hadith.gading.dev/books/$name?range=300-500'
      );
      return response.data;
    } on DioException catch (e) {
      String errorMessage = _extractErrorMessage(e);
      throw Exception(errorMessage);
    }
  }

  Future<Map<String, dynamic>> getAsmaaHusna() async {
    try {
      Response response = await _dio.get(
          'https://asmaul-husna-api.vercel.app/api/all'
      );
      return response.data;
    } on DioException catch (e) {
      String errorMessage = _extractErrorMessage(e);
      throw Exception(errorMessage);
    }
  }

  /// Extracts a user-friendly error message from the DioException.
  String _extractErrorMessage(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      final errors = e.response?.data['errors'];
      if (errors is List) {
        return errors.map((error) => '${error['field']}: ${error['message']}')
            .join(', ');
      }
    }
    return e.response?.data['message'] ?? 'Something went wrong';
  }

  Future<Map<String, dynamic>> getPrayer(String date  ) async {
    try {
      Response response = await _dio.get(
          'https://api.aladhan.com/v1/timingsByAddress/$date?address=Cairo,UAE&method=7'
      );
      return response.data;
    } on DioException catch (e) {
      String errorMessage = _extractErrorMessage(e);
      throw Exception(errorMessage);
    }
  }



}
