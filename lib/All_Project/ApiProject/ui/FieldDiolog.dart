import 'package:flutter/material.dart';
import '../../StudentProfileCard/Widget/TextDesign.dart';
void showMyFieldDialog(
  BuildContext context,
  productTotalPriceController,
  productUnitPriceController,
  productQtyController,
  productCodeController,
  productNameController,
  productImgController,
    formKey,
    onPressed,
) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.production_quantity_limits,
            size: 30,
            color: Colors.indigo[900]!,
          ),
          SizedBox(width: 10),
          TextDesign(
            text: 'Update  ',
            fontSize: 20,
            color: Colors.grey[800]!,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      content:SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
          children: [
            textF(Controller: productImgController, hintText: 'product Img', labelText: 'IMG'),
            SizedBox(height: 5),
            textF(Controller: productNameController, hintText: 'product name', labelText: 'Name'),
            SizedBox(height: 5),
            textF(Controller: productTotalPriceController, hintText: 'TotalPrice', labelText: 'TotalPrice'),
            SizedBox(height: 5),
            textF(Controller: productUnitPriceController, hintText: 'UnitPrice ', labelText: 'UnitPrice'),
            SizedBox(height: 5),
            textF(Controller: productQtyController, hintText: 'Qty ', labelText: 'QTY'),
            SizedBox(height: 5),
            textF(Controller: productCodeController, hintText: 'product Code ', labelText: 'product Code'),

          ],
        )),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextDesign(
            text: 'Close',
            fontSize: 15,
            color: Colors.indigo[700]!,
          ),
        ),
        TextButton(
          onPressed:onPressed,
          child: TextDesign(
            text: 'submit',
            fontSize: 15,
            color: Colors.indigo[700]!,
          ),
        ),
      ],
    ),
  );
}

class textF extends StatelessWidget {
  final TextEditingController Controller;
  final String hintText;
  final String labelText;


  const textF({super.key, required this.Controller, required this.hintText, required this.labelText,}) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      maxLines: 2,
      decoration: InputDecoration(
        hintText:hintText,
        hintStyle: TextStyle(color: Colors.grey),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        } else {
          return null;
        }
      }
    );
  }
}
