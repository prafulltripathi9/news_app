class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsContent;
  String newsUrl;

  //Craete Constructor
  NewsArt({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsContent,
    required this.newsUrl,
  });

  //This method retunr the data into good format
  static NewsArt fromApitoApp(Map<String,dynamic> article){
    return NewsArt(
     imgUrl: article["urlToImage"] ?? "https://cdn.pixabay.com/photo/2012/11/08/07/26/news-65343_1280.jpg",
     newsHead: article["title"]  ?? "--", 
     newsDes: article["description"]?? "--",
     newsContent: article["content"]?? "--", 
     newsUrl: article["url"]?? "https://www.indiatoday.in/world/story/france-protests-1200-arrested-arson-looting-spread-across-cities-3019939-2026-10-18",   
    );
  }
}