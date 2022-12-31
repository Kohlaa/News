import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/NewsResponse.dart';
import '../../myTheme.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routeName = 'news_details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // padding: EdgeInsets.all(12),
        // margin: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias, // rounded
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(
              height: 10,
            ),
            Text(news.title ?? '',
                style: TextStyle(
                    color: MyTheme.greyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
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
            SizedBox(
              height: 10,
            ),
            Text(
              news.description ?? '',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                    onPressed: () {
                      openUrl(news.url);
                    },
                    icon: Text('View Full Article',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    label: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 16,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) return;
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}
