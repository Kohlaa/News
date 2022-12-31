import 'package:flutter/material.dart';

import '../../api_manager.dart';
import '../../model/NewsResponse.dart';
import '../../myTheme.dart';
import '../newsItem.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 25,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.clear,
          size: 25,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(searchKeyword:query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Suggestions'));
  }
}
