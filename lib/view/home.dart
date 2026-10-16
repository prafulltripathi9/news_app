import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchNews.dart';
import 'package:news_app/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Fetchnews.fetchNews();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewsContainer(imgUrl: "https://images.pexels.com/photos/3866816/pexels-photo-3866816.jpeg?_gl=1*1xor5o5*_ga*MzczMTMxNjA5LjE3NzI0NTI4NTY.*_ga_8JE65Q40S6*czE3OTIwNjg2NDIkbzIkZzEkdDE3OTIwNjg2NjckajQwJGwwJGgw", newsHead: "6G in INDIA", newsDes: "The strategy reflects Jio's broader focus on developing and monetising its proprietary technology stack, as the company looks to expand beyond connectivity into digital services and international technology partnerships.Speaking at Jio Platforms IPO press conference, Ambani said the objective was to make the transition to 6G through a software-led approach, potentially reducing the need to replicate the extensive physical infrastructure deployed for previous generations of mobile networks.Ji..", newsUrl: "https://www.moneycontrol.com/news/business/ipo/jio-aims-to-transition-to-6g-through-software-upgrades-says-akash-ambani-14053104.html");
        },
      ),
    );
  }
}
 