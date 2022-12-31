import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_application/home/category/categoryFragment.dart';

import 'package:news_application/home/category/category_details.dart';
import 'package:news_application/home/home_settings/setting_tab.dart';
import 'package:news_application/home/search/search.dart';

import '../model/category.dart';
import '../myTheme.dart';
import 'homeDrawer.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.whiteColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/main_background.png',
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          title: Text('News App', style: Theme.of(context).textTheme.headline1),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                   showSearch(context: context, delegate: NewsSearch());
                },
                icon: Icon(
                  Icons.search,
                  size: 32,
                ))
          ],
        ),
        drawer: Drawer(
          child: homeDrawer(onDrawerItemClicked: onDrawerItemClicked),
        ),
        body: selectedItemDrawer == homeDrawer.setting
            ? SettingTab()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClicked: onCategoryItemClicked)
                : CategoryDetails(
                    category: selectedCategory!,
                  ),
      ),
    );
  }

  Category1? selectedCategory = null;

  void onCategoryItemClicked(Category1 category) {
    selectedCategory = category;
    setState(() {});
  }

  var selectedItemDrawer = homeDrawer.categories;

  void onDrawerItemClicked(int selectedItem) {
    selectedItemDrawer = selectedItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
