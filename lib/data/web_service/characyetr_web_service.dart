import 'package:dio/dio.dart';

class CharacterWebService {
  late Dio dio;
  CharacterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.breakingbadapi.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> gatCharacterQuotes(String charName) async {
    try {
      Response response =
          await dio.get('quote', queryParameters: {'author': charName});
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
