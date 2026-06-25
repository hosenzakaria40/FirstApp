import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/ColorTheme.dart';


class BMI_Input_Card extends StatelessWidget {
  const BMI_Input_Card({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController heightController,
    required TextEditingController weightController,
  }) : _formKey = formKey, _heightController = heightController, _weightController = weightController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _heightController;
  final TextEditingController _weightController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _heightController,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }

                  final height = double.tryParse(value);

                  if (height == null) {
                    return 'Please enter a valid height';
                  }

                  if (height <= 0 || height > 500) {
                    return 'Please enter a valid height';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsetsGeometry.all(20.sp),
                    suffixText: 'cm',
                    hintText: '170',
                    labelText: 'Height',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorTheme.indigoColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorTheme.redColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorTheme.redColor,
                      ),
                    )
                ),
              ),
              SizedBox(height: 15.h),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _weightController,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your width';
                  }

                  final width = double.tryParse(value);

                  if (width == null) {
                    return 'Please enter a valid width';
                  }

                  if (width <= 0 || width > 500) {
                    return 'Please enter a valid width';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsetsGeometry.all(20.sp),
                    hintText: ' 56',
                    labelText: 'width',
                    suffixText: 'kg',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorTheme.indigoColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorTheme.redColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorTheme.redColor,
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}