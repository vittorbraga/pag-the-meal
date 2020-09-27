import 'package:flutter/material.dart';
import 'package:pag_the_meal/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  Category _category;
  CategoryWidget(this._category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.0,
          child: Card(
            child: Image.network(_category.strCategoryThumb),
          )
        ),
        Text(
          _category.strCategory,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700]
          )
        )
      ]
    );
  }
}