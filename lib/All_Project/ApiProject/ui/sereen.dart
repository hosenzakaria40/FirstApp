import 'package:fast_app/All_Project/ApiProject/ApiCall/apiCall.dart';
import 'package:fast_app/All_Project/StudentProfileCard/Widget/TextDesign.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/model.dart';
import '../utils/utils.dart';
import 'FieldDiolog.dart';

class Sereen extends StatefulWidget {
  const Sereen({super.key});

  @override
  State<Sereen> createState() => _SereenState();
}

class _SereenState extends State<Sereen> {
  bool isUpdate = false;
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

  Future<void> postProduct(date) async {
    await productController.createProduct(date, context);
    await fetchData();
  }

  Future<bool> deleteProduct(BuildContext context, String productId) async {
    final url = Urls.deleteProductURL(productId);
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Delete success'),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  void addProduct(BuildContext context, bool isUpdate, Data? item) {
    if (isUpdate && item != null) {
      productNameController.text = item.productName ?? '';
      productCodeController.text = item.productCode.toString();
      productImgController.text = item.img ?? '';
      productQtyController.text = item.qty.toString();
      productUnitPriceController.text = item.unitPrice.toString();
      productTotalPriceController.text = item.totalPrice.toString();
    } else {
      productNameController.clear();
      productCodeController.clear();
      productImgController.clear();
      productQtyController.clear();
      productUnitPriceController.clear();
      productTotalPriceController.clear();
    }

    FieldDiolog(
      context: context,
      productTotalPriceController: productTotalPriceController,
      productUnitPriceController: productUnitPriceController,
      productQtyController: productQtyController,
      productCodeController: productCodeController,
      productNameController: productNameController,
      productImgController: productImgController,
      isUpdate: isUpdate,
      formKey: formKey,
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;

        if (isUpdate && item != null) {
          await productController.updateProduct(
            context,
            item.sId!, // id
            Data(
              productName: productNameController.text,
              productCode: int.parse(productCodeController.text),
              img: productImgController.text,
              qty: int.parse(productQtyController.text),
              unitPrice: int.parse(productUnitPriceController.text),
              totalPrice: int.parse(productTotalPriceController.text),
              sId: item.sId,
            ),
          );
        } else {
          await postProduct(
            Data(
              productName: productNameController.text,
              productCode: int.parse(productCodeController.text),
              img: productImgController.text,
              qty: int.parse(productQtyController.text),
              unitPrice: int.parse(productUnitPriceController.text),
              totalPrice: int.parse(productTotalPriceController.text),
              sId: '',
            ),
          );
        }

        Navigator.pop(context);
        await fetchData();
      },
    ).showMyFieldDialog();
  }

  final TextEditingController productTotalPriceController =
      TextEditingController();
  final TextEditingController productUnitPriceController =
      TextEditingController();
  final TextEditingController productQtyController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productImgController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        title: Text('Api CURD Project'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addProduct(context, isUpdate = false, null);
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
                  Expanded(
                    child: TextDesign(
                      text: item.productName.toString(),
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
                          addProduct(context, true, item);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 13,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await deleteProduct(context, item.sId.toString());
                          await fetchData();
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
