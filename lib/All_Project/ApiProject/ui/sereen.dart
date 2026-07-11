import 'package:fast_app/All_Project/ApiProject/ApiCall/apiCall.dart';
import 'package:fast_app/All_Project/StudentProfileCard/Widget/TextDesign.dart';
import 'package:flutter/material.dart';

import '../Model/model.dart';
import 'FieldDiolog.dart';

class Sereen extends StatefulWidget {
  const Sereen({super.key});

  @override
  State<Sereen> createState() => _SereenState();
}

class _SereenState extends State<Sereen> {
  ProductController productController = ProductController();

  Future<void> fetchData() async {
    await productController.getProduct(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> deleteProduct(String productId) async {
    await productController.deleteProduct(context, productId);
    await fetchData();
  }

  Future<void> postProduct(date) async {
    await productController.postProduct(context, date);
    await fetchData();
  }

  // Future<void> updateProduct(String productId) async {
  //   await productController.updateProduct(context, productId);
  //   await fetchData();
  // }

  void addProduct(BuildContext context) {
    showMyFieldDialog(
      context,
      productTotalPriceController,
      productUnitPriceController,
      productQtyController,
      productCodeController,
      productNameController,
      productImgController,
      formKey,
      () {
        if (formKey.currentState!.validate()) {
          Data date = Data(

            productName: productNameController.text,
            productCode: int.parse(productCodeController.text),
            img: productImgController.text,
            qty: int.parse(productQtyController.text),
            unitPrice: int.parse(productUnitPriceController.text),
            totalPrice: int.parse(productTotalPriceController.text),
          );
          postProduct(date);
        }
      },
    );
  }

  final TextEditingController productTotalPriceController =
      TextEditingController();
  final TextEditingController productUnitPriceController =
      TextEditingController();
  final TextEditingController productQtyController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productImgController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productTotalPriceController.dispose();
    productUnitPriceController.dispose();
    productQtyController.dispose();
    productCodeController.dispose();
    productNameController.dispose();
    productImgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Api Project'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addProduct(context);
        },

        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.70,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final item = productController.products[index];
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Image.network(
                      item.img.toString(),

                      // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6KigskFmnRRqvcC6FYAPQNaNdW1ahozaQa5gHfK7PYQ&s=10',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Flexible(
                          child: const Center(
                            child: TextDesign(
                              text: 'not found',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextDesign(
                    text: item.productName.toString(),
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextDesign(
                          text: 'TotalPrice:${item.totalPrice}',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      Expanded(
                        child: TextDesign(
                          text: 'UnitPrice: ${item.unitPrice.toString()}',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // updateProduct(item.sId.toString());
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 13,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteProduct(item.sId.toString());
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
