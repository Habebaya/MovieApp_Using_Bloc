import 'package:dio/dio.dart';
import 'package:usingbloc/constans/strings.dart';
import 'package:usingbloc/data/models/character.dart';

class CharactersWebServices{
  late Dio dio;

  CharactersWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000  ,
      receiveTimeout:20 * 1000,

    );
    dio = Dio(options);

  }

  Future <List<dynamic>> getAllCharacters() async{
    try {
      Response response = await dio.get('characters');
      print(response.data);
      return response.data;
    }catch(e){
      print(e.toString());
      return [];

    }



  }


}