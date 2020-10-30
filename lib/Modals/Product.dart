

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Product with ChangeNotifier {

  final String id;
  final String title;
  final String price;
  final String imageUrl;
  var  isCart="false";

  Product(
      {
      this.id,
        this.title,
        this.price,
        this.imageUrl,
        this.isCart
      }

      );



}