import 'dart:convert';

import 'package:valyuta/model/currency_model.dart';
import 'package:http/http.dart' as http;
class Consts{
  Consts._();
  static const  String url = "https://cbu.uz/oz/arkhiv-kursov-valyut/json/";
}

class HttpService {


  static Future<List<CurrencyModel>> get() async {
    try {
      final url = Uri.parse(Consts.url);
      final responce = await http.get(url);

      if (responce.statusCode == 200 || responce.statusCode == 201){
        final json = jsonDecode(responce.body);
        List<CurrencyModel> list =[];
        for(var m in json){
          list.add(CurrencyModel.fromJson(m));

        }
        return list ;
      } else {
        return [];
      }
    } catch(e) {
      return [];

    }

  }
}
