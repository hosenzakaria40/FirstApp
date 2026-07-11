import 'dart:convert';

import 'package:fast_app/All_Project/ApiProject/Model/model.dart';
import 'package:fast_app/All_Project/ApiProject/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List<Data> products = [];

  Future<void> getProduct(BuildContext context) async {
    final response = await http.get(Uri.parse(Urls.readProductURL));
    /*
    or
    final url=Uri.parse(Urls.readProductURL);
    final response=await http.get(url);
     */
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(jsonResponse);
      products = model.data ?? [];
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
  }
  Future<bool> postProduct(BuildContext context, Data date) async {
    final response = await http.post(
      Uri.parse(Urls.createProductURL),

      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: {
        'ProductName':date.productName,
        'ProductCode': DateTime.now().millisecondsSinceEpoch.toString,
        'Img': date.img,
        'Qty': date.qty,
        'UnitPrice': date.unitPrice,
        'TotalPrice': date.totalPrice,
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
      return false;
    }
  }


  Future<bool> deleteProduct(BuildContext context, String productId) async {
    final response = await http.delete(
      Uri.parse(Urls.deleteProductURL(productId)),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
      return false;
    }
  }

  // Future<bool> updateProduct(BuildContext context, String productId,Data date) async {
  //   final response = await http.put(
  //     Uri.parse(Urls.updateProductURL(productId)),
  //     body: {
  //       'ProductName':date.productName,
  //       'ProductCode': DateTime.now().millisecondsSinceEpoch.toString,
  //       'Img': date.img,
  //       'Qty': date.qty,
  //       'UnitPrice': date.unitPrice,
  //       'TotalPrice': date.totalPrice,
  //     },
  //   );
  //   print(response.statusCode);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
  //     return false;
  //   }
  // }
}
