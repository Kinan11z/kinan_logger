import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLogger {
  Dio dio = Dio();

  loggerFetchData({required String endpoint, required Logger logger}) async {
    try {
      var response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        logger.i('Success to fetch data');
        return response.data;
      } else {
        logger.e('There was an error fetching data');
      }
    } catch (e) {
      logger.e('There is a network error \n' + e.toString());
    }
  }

  loggerSendData<T>(
      {required String endpoint,
      required Logger logger,
      required T data}) async {
    try {
      var response = await dio.post(endpoint, data: data);
      if (response.statusCode == 201) {
        logger.i('Success to send data');
      } else {
        logger.e('There was an error fetching data');
      }
    } catch (e) {
      logger.e('There is a network error \n' + e.toString());
    }
  }
}
