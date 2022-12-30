import 'package:flutter/material.dart';
import 'package:news_application/api_manager.dart';
import 'package:news_application/home/newsItem.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourcesResponse.dart';
import 'package:news_application/myTheme.dart';

class NewsContainer extends StatelessWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: MyTheme.primaryLightColor,
            ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
