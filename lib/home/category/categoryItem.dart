import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_application/myTheme.dart';

import '../../model/category.dart';

class CategoryItem extends StatelessWidget {
  Category1 category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color(category.color),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular((index % 2 == 0) ? 18 : 0),
              bottomRight: Radius.circular((index % 2 == 0) ? 0 : 18))),
      child: Column(
        children: [
          Image.asset(category.imagePath,
              height: 100
          ),
          Text(category.title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.whiteColor)),
        ],
      ),
    );
  }
}
