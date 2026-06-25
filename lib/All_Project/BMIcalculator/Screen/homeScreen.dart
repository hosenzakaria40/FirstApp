import 'package:fast_app/All_Project/BMIcalculator/Core/ColorTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';
import '../Widget/ResultCard.dart';
import '../Widget/BMI_Table.dart';
import '../Widget/BMI_Input_Card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double? _bmi;
  String _category = '';
  Color _color = ColorTheme.greenColor;

  void calculateBMI() {
    final double height = double.parse(_heightController.text) / 100;
    final double weight = double.parse(_weightController.text);

    final double bmi = weight / (height * height);

    final (category, color) = _getBMIResult(bmi);

    setState(() {
      _bmi = bmi;
      _category = category;
      _color = color;
    });
    _heightController.clear();
    _weightController.clear();
  }

  (String, Color) _getBMIResult(double bmi) {
    if (bmi >= 30) {
      return ('Obese', ColorTheme.redColor);
    } else if (bmi >= 25) {
      return ('Overweight', ColorTheme.yellowColor);
    } else if (bmi >= 18.5) {
      return ('Normal', ColorTheme.greenColor);
    } else {
      return ('Underweight', ColorTheme.blueColor);
    }
  }

  void _resetFields() {
    _heightController.clear();
    _weightController.clear();

    setState(() {
      _bmi = null;
      _category = '';
      _color = ColorTheme.greenColor;
    });
  }

  static const row = [
    ('< 18.5', 'Underweight', ColorTheme.blueColor),
    ('18.5 - 24.9', 'Normal', ColorTheme.greenColor),
    ('> 25', 'Overweight', ColorTheme.yellowColor),
    ('> 30', 'Obese', ColorTheme.redColor),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20.sp),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextDesign(
                  text: 'BMI Calculator',
                  fontSize: 25.sp,
                  color: Colors.grey[900]!,
                ),
                SizedBox(height: 20.h),
                BMI_Input_Card(formKey: _formKey, heightController: _heightController, weightController: _weightController),
                SizedBox(height: 15.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    padding: EdgeInsets.symmetric(vertical: 12.sp),
                    backgroundColor: ColorTheme.indigoColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      calculateBMI();
                    }
                  },
                  child: TextDesign(
                    text: 'Calculate BMI',
                    fontSize: 20.sp,
                    color: ColorTheme.whiteColor,
                  ),
                ),
                SizedBox(height: 15.h),
                if (_bmi != null) ...[
                  ResultCard(
                    bmi: _bmi!,
                    category: _category,
                    categoryColor: _color,
                  ),

                  TextButton(onPressed: _resetFields, child: Text('Reset')),
                ],

                BMI_Table(row: row),
                SizedBox(height: 15.h),
                Card(
                    elevation: 5,
                    color: ColorTheme.blueColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextDesign(text: '👉 Created By : Mr. KiNg ⭐', fontSize: 20.sp, color: ColorTheme.indigoColor,fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}




