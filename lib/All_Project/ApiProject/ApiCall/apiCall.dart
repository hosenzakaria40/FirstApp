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

  Future<bool> createProduct(Data data, BuildContext context) async {
    final url = Uri.parse(Urls.createProductURL);
    final response = await http.post(
      url,

      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice,
      }),
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Create success'),backgroundColor: Colors.green,));
      return true;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong'),backgroundColor: Colors.red,));
      return false;
    }
  }

  Future<bool> deleteProduct(BuildContext context, String productId) async {
    final response = await http.delete(
      Uri.parse(Urls.deleteProductURL(productId)),
    );
    // print("Product ID: $productId");
    // print("Status Code: ${response.statusCode}");
    // print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      getProduct(context);
      return true;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong'),backgroundColor: Colors.red,));
      return false;
    }
  }

  Future<bool> updateProduct(
    BuildContext context,
    String productId,
    Data data,
  ) async {
    final response = await http.post(
      Uri.parse(Urls.updateProductURL(productId)),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": data.productCode,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice,
      }),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Update success'),backgroundColor: Colors.green,));
      return true;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong'),backgroundColor: Colors.red,));
      return false;
    }
  }
}
