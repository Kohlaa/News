import 'package:flutter/material.dart';
import 'package:news_application/myTheme.dart';

class homeDrawer extends StatelessWidget {
  static const int categories = 0;
  static const int setting = 1;
  Function onDrawerItemClicked;
  homeDrawer({required this.onDrawerItemClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: MyTheme.primaryLightColor,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Center(
              child: Text('News App',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                onDrawerItemClicked(homeDrawer.categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 10,),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                onDrawerItemClicked(homeDrawer.setting);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
