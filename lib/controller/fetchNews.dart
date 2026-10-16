import 'dart:convert';

import 'package:http/http.dart';
class Fetchnews {
  static fetchNews() async{
    Response response = await get(Uri.parse("https://newsapi.org/v2/everything?q=apple&from=2026-10-15&to=2026-10-15&sortBy=popularity&apiKey=561e55be0b94433cbab7168693ee214e"));

    Map bodyData = jsonDecode(response.body);
    print(bodyData);
  }
}