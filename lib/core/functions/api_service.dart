import 'package:dio/dio.dart';

main(){
  ApiService api=ApiService(dio: Dio());
  api.getHadith();
}
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
      print('GET request to $endPoints failed: ${e.response?.statusCode} - $errorMessage');
      throw Exception(errorMessage);
    }
  }

  Future<Map<String, dynamic>> getHadith() async {
    try {
      // String apiKey = '\$2y\$10\$zXGetdrbFxiXuGB5JXNR2efIkrYbjcZRHJA4wz4KLljp26VYQ0O'; // Escape $ using \
      Response response = await _dio.get(
        'https://api.hadith.gading.dev/books'
     //   'https://hadithapi.com/public/api/hadiths?apiKey=$apiKey', // Use the apiKey variable
      );
    //  print("$response");
      return response.data;

    } on DioException catch (e) {
      String errorMessage = _extractErrorMessage(e);
     // print('GET request to $endPoints failed: ${e.response?.statusCode} - $errorMessage');
      throw Exception(errorMessage);
    }
  }

  /// Extracts a user-friendly error message from the DioException.
  String _extractErrorMessage(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      final errors = e.response?.data['errors'];
      if (errors is List) {
        return errors.map((error) => '${error['field']}: ${error['message']}').join(', ');
      }
    }
    return e.response?.data['message'] ?? 'Something went wrong';
  }
}
