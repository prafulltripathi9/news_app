import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app/model/newsArt.dart';

class Fetchnews {
  static List<String> sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

 static Future<NewsArt?> fetchNews() async {
  final random = Random();

  final sourceID = sourcesId[random.nextInt(sourcesId.length)];

  print("Selected source: $sourceID");

  try {
    final response = await get(
      Uri.parse(
        "https://newsapi.org/v2/top-headlines"
        "?sources=$sourceID"
        "&apiKey=561e55be0b94433cbab7168693ee214e",
      ),
    );

    // Check HTTP response.
    if (response.statusCode != 200) {
      print("HTTP Error: ${response.statusCode}");
      print(response.body);
      return null;
    }

    final Map<String, dynamic> bodyData =
        jsonDecode(response.body) as Map<String, dynamic>;

    // Check API response status.
    if (bodyData["status"] != "ok") {
      print("API Error: ${bodyData["message"]}");
      return null;
    }

    // Validate articles.
    final articlesData = bodyData["articles"];

    if (articlesData is! List || articlesData.isEmpty) {
      print("No articles found for source: $sourceID");
      return null;
    }

    final myArticle = articlesData[
        random.nextInt(articlesData.length)];

    print("Selected article:");
    print(myArticle);

    return NewsArt.fromApitoApp(myArticle);
  } catch (e) {
    print("Error fetching news: $e");
    return null;
  }
}
}
