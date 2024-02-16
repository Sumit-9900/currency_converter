import 'dart:convert';

import 'package:currency_converter/models/allcurrencyrates.dart';
import 'package:currency_converter/services/utils/api_url.dart';
import 'package:http/http.dart' as http;

class CurrencyServices {
  Future<Allcurrencyrates> getApi() async {
    final res = await http.get(
      Uri.parse(Api.allcurrencyratesApi),
    );
    final allcurrencyrates = allcurrencyratesFromJson(res.body);
    if (res.statusCode == 200) {
      return allcurrencyrates;
    } else {
      throw Exception('Failed');
    }
  }

  Future<Map> getApi1() async {
    final res = await http.get(
      Uri.parse(Api.allcurrencyApi),
    );
    final data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed');
    }
  }
}
