import 'package:flutter/material.dart';
import '../../StudentProfileCard/Widget/TextDesign.dart';

class FieldDiolog {
  final BuildContext context;
  final TextEditingController productTotalPriceController;
  final TextEditingController productUnitPriceController;
  final TextEditingController productQtyController;
  final TextEditingController productCodeController;
  final TextEditingController productNameController;
  final TextEditingController productImgController;

  final GlobalKey<FormState> formKey;
  final VoidCallback onPressed;
 final bool isUpdate;

  FieldDiolog({
    required this.context,
    required this.productTotalPriceController,
    required this.productUnitPriceController,
    required this.productQtyController,
    required this.productCodeController,
    required this.productNameController,
    required this.productImgController,
    required this.formKey,
    required this.onPressed,
    required this.isUpdate,
  });

  void showMyFieldDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.production_quantity_limits,
                size: 30,
                color: Colors.indigo[900],
              ),
              const SizedBox(width: 10),
              TextDesign(
                text:isUpdate ? 'Update product' : 'Add product',
                fontSize: 20,
                color: Colors.grey[800]!,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextF(
                    controller: productImgController,
                    hintText: 'Product Image',
                    labelText: 'Image',
                    textInputType: TextInputType.url,
                  ),
                  const SizedBox(height: 5),
                  TextF(
                    controller: productNameController,
                    hintText: 'Product Name',
                    labelText: 'Name',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 5),
                  TextF(
                    controller: productTotalPriceController,
                    hintText: 'Total Price',
                    labelText: 'Total Price',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 5),
                  TextF(
                    controller: productUnitPriceController,
                    hintText: 'Unit Price',
                    labelText: 'Unit Price',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 5),
                  TextF(
                    controller: productQtyController,
                    hintText: 'Quantity',
                    labelText: 'Qty',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 5),
                  TextF(
                    controller: productCodeController,
                    hintText: 'Product Code',
                    labelText: 'Code',
                    textInputType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: TextDesign(
                text: 'Close',
                fontSize: 15,
                color: Colors.indigo[700]!,
              ),
            ),
            TextButton(
              onPressed:onPressed,
              child: TextDesign(
                text: 'Submit',
                fontSize: 15,
                color: Colors.indigo[700]!,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TextF extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;

  const TextF({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType, // ✅ এখানে keyboardType হবে
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter a value';
        }
        return null;
      },
    );
  }
}