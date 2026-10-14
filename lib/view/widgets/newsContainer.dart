import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {

  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;

  NewsContainer({super.key,
  
  required this.imgUrl,
  required this.newsHead,
  required this.newsDes,
  required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              children: [
                Image.network("src"),

                Text("News HeadLine"),
                Text("News Description"),
                ElevatedButton(onPressed: (){}, child: Text('Read More')),
              ],
            ),
          );
  }
}