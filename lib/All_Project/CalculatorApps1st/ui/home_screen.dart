import 'package:fast_app/All_Project/StudentProfileCard/Widget/TextDesign.dart';
import 'package:flutter/material.dart';
import '../core/AppColor.dart';
import '../model/calculate.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final List<String> num = [
    '1',
    '2',
    '3',
    '*',
    '4',
    '5',
    '6',
    '/',
    '7',
    '8',
    '9',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  final List<String> operation = ['+', '-', '*', '/'];
  String input1 = '';
  String input2 = '';
  String operator = '';
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorCal.backgroundColor,
      // appBar: AppBar(
      //   title: Text('Calculator'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .end,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColorCal.outputColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextDesign(
                    text: "$input1 $operator $input2",
                    fontSize: 28,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  TextDesign(
                    text: output.isEmpty ? "0" : output,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColorCal.numberColor,
                  ),
                ],
              ),
            ),
            Divider(thickness: 2, color: AppColorCal.numberColor),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorCal.clearColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      setState(() {
                        input1 = '';
                        input2 = '';
                        operator = '';
                        output = '';
                      });
                    },
                    child: TextDesign(
                      text: "C",
                      fontSize: 30,
                      color: AppColorCal.numberColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorCal.deleteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      setState(() {
                        if (input2.isNotEmpty) {
                          input2 = input2.substring(0, input2.length - 1);
                        } else if (operator.isNotEmpty) {
                          operator = '';
                        } else if (input1.isNotEmpty) {
                          input1 = input1.substring(0, input1.length - 1);
                        }
                      });
                    },
                    child: TextDesign(
                      text: 'Del',
                      fontSize: 30,
                      color: AppColorCal.numberColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                itemCount: num.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: operation.contains(num[index])
                        ? AppColorCal.operationColor
                        : num[index] == "="
                        ? AppColorCal.calculateColor
                        : AppColorCal.buttonColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        String value = num[index];

                        setState(() {
                          // Operator
                          if (operation.contains(value)) {
                            if (input1.isNotEmpty) {
                              operator = value;
                            }
                          }
                          // Equal
                          else if (value == '=') {
                            if (input1.isEmpty ||
                                input2.isEmpty ||
                                operator.isEmpty) {
                              output = "Invalid Input";
                              return;
                            }

                            try {
                              Calculate calculate = Calculate(
                                num1: double.parse(input1),
                                num2: double.parse(input2),
                                operation: operator,
                              );

                              output = calculate.calculate().toString();

                              // Consecutive Calculation
                              input1 = output;
                              input2 = '';
                              operator = '';
                            } catch (e) {
                              output = "Error";
                            }
                          }
                          // Decimal
                          else if (value == '.') {
                            if (operator.isEmpty) {
                              if (!input1.contains('.')) {
                                input1 += '.';
                              }
                            } else {
                              if (!input2.contains('.')) {
                                input2 += '.';
                              }
                            }
                          }
                          // Number
                          else {
                            if (operator.isEmpty) {
                              input1 += value;
                            } else {
                              input2 += value;
                            }
                          }
                        });
                      },
                      child: Center(
                        child: TextDesign(
                          text: num[index],
                          fontSize: 35,
                          color: AppColorCal.numberColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
