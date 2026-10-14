import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/newsContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewsContainer(imgUrl:   , newsHead: newsHead, newsDes: newsDes, newsUrl: newsUrl);
        },
      ),
    );
  }
}
