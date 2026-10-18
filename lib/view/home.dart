import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchNews.dart';
import 'package:news_app/model/newsArt.dart';
import 'package:news_app/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsArt? newsArt;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    if (mounted) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
    }

    try {
      final article = await Fetchnews.fetchNews();

      if (!mounted) return;

      setState(() {
        newsArt = article;
        isLoading = false;

        if (article == null) {
          errorMessage = 'Unable to fetch news. Please try again.';
        }
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = 'Something went wrong. Please try again.';
      });

      debugPrint('Error fetching news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (newsArt == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(errorMessage ?? 'No news available.'),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: getNews,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return NewsContainer(
            imgUrl: newsArt!.imgUrl,
            newsHead: newsArt!.newsHead,
            newsUrl: newsArt!.newsUrl,
            newsContent: newsArt!.newsContent,
            newsDes: newsArt!.newsDes,
          );
        },
      ),
    );
  }
}