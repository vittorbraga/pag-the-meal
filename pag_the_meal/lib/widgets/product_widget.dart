import 'package:flutter/material.dart';
import 'package:pag_the_meal/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  Product _product;
  ProductWidget(this._product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130.0,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Image.network(_product.strMealThumb),
          )
        ),
        Text(
          _product.strMeal,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700]
          )
        )
      ]
    );
  }
}