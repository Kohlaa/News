import 'package:flutter/material.dart';
import 'package:news_application/myTheme.dart';

import '../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(12),
      // margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,   // rounded
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.network(news.urlToImage ?? ''),
          ),
          SizedBox(
            height: 10,
          ),
          Text(news.title ?? '',
              style: TextStyle(color: MyTheme.greyColor, fontSize: 15,fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Text(news.content ?? '',
              style: TextStyle(
                  color: MyTheme.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 10,
          ),
          Text(
            news.publishedAt ?? '',
            style: TextStyle(
              color: MyTheme.greyColor,
              fontSize: 15,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
