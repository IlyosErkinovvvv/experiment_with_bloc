import 'package:dio/dio.dart';
import 'package:experiment_with_bloc/data/models/currency_model.dart';

class CurrencyService {
  Future<dynamic> getCurrency() async {
    try {
      Response response = await Dio(BaseOptions(validateStatus: (statusCode) {
        if (statusCode! >= 199 && statusCode <= 599) {
          return true;
        } else {
          return false;
        }
      })).get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
