import 'package:flutter/material.dart';
import 'package:news_application/model/category.dart';

import 'categoryItem.dart';

class CategoryFragment extends StatelessWidget {
  var categoryList = Category1.getCategories();
  Function onCategoryItemClicked;

  CategoryFragment({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClicked(categoryList[index]);
                  },
                  child: CategoryItem(
                    category: categoryList[index],
                    index: index,
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
