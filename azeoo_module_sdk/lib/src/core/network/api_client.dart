import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({
    required String baseUrl,
    required String authToken, // doit déjà contenir "Bearer api_..."
    required int userId,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           headers: {
             'Authorization': authToken, // pas de "Bearer " ajouté
             'Accept-Language': 'fr-FR',
             'X-User-Id': userId.toString(), // obligatoire !
           },
         ),
       );

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? headers}) {
    return _dio.get(path, options: Options(headers: headers));
  }
}
