import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_application/api_manager.dart';
import 'package:news_application/home/tab_container.dart';
import 'package:news_application/model/SourcesResponse.dart';

import '../../model/category.dart';

class CategoryDetails extends StatelessWidget {
  Category1 category;

  CategoryDetails({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
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
        var sourcesList = snapshot.data?.sources ?? [];
        return TabContainer(sourcesList: sourcesList);
      },
    );
  }
}
