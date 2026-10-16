import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsContent;

  NewsContainer({
    super.key,

    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
    required this.newsContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      //Set Image
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            imgUrl,
          ),
          //Content of news
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 15),
                Center(
                  child: Text(
                    newsHead,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  newsContent,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text(newsDes, style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
              ],
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                print("Going to $newsUrl");
              },
              child: Text('Read More'),
            ),
          ),
        ],
      ),
    );
  }
}
