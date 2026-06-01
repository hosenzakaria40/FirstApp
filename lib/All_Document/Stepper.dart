import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  bool isBig = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Stepper'), backgroundColor: Colors.blue),
        body: Column(
          children: [
            Flexible(
              child: Stepper(
                // type: StepperType.vertical,
                steps: [
                  Step(
                    title: Text('Email'),
                    content: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                    ),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Password'),
                    content: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                    ),
                    isActive: true,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
               setState(() {
                 isBig = !isBig;
               });
               if(isBig){
                 print('true');
               }else{
                 print('false');
               }
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 5),
                height: isBig ? 100: 50,
                width: isBig ? 100 : 50,
                color: isBig ? Colors.blue : Colors.blueGrey,

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isBig = !isBig;
                  });
                  if(isBig){
                    print('true');
                  }else{
                    print('false');
                  }
                },
                child: AnimatedPadding(
                  padding: EdgeInsetsGeometry.all(isBig ? 1 :15),
                  duration:Duration(seconds: 1),
                  child: Container(height: 100,width: 100,color: Colors.blue,),
                ),
              ),
            ),
            Spacer(
              key: Key('32'),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}

/*
Stepper Properties
1. currentStep

কোন Step Active আছে।

currentStep: currentStep
2. steps

সব Step-এর List।

steps: [
  Step(...),
  Step(...),
]
3. onStepContinue

Continue Button চাপলে।

onStepContinue: () {
  setState(() {
    currentStep++;
  });
}
4. onStepCancel

Back Button চাপলে।

onStepCancel: () {
  setState(() {
    currentStep--;
  });
}
5. onStepTapped

কোন Step-এ Click করলে।

onStepTapped: (index) {
  setState(() {
    currentStep = index;
  });
}
Step Properties
title

Step-এর নাম।

title: Text("Email")
subtitle

Sub Heading।

subtitle: Text("Required")
content

Step-এর ভিতরের Widget।

content: TextField()

এখানে TextField, Form, Button সব দিতে পারো।

isActive

Step Active কিনা।

isActive: currentStep >= 0
state

Step-এর Status।

state: StepState.complete
StepState Types
indexed

Default

StepState.indexed
1
2
3
complete

Completed

StepState.complete
✓
disabled

Disable

StepState.disabled
editing

Editing

StepState.editing
✏️
error

Error দেখাবে।

StepState.error
❌
Stepper Type
Vertical (Default)
type: StepperType.vertical
Step 1
  |
Step 2
  |
Step 3
Horizontal
type: StepperType.horizontal
Step1  Step2  Step3
Custom Button

Default Continue/Cancel Button পরিবর্তন করতে:

controlsBuilder: (
  context,
  details,
) {
  return Row(
    children: [
      ElevatedButton(
        onPressed: details.onStepContinue,
        child: Text("Next"),
      ),

      ElevatedButton(
        onPressed: details.onStepCancel,
        child: Text("Back"),
      ),
    ],
  );
}
Interview Question
Stepper কেন ব্যবহার করি?

Multi-Step Form বানানোর জন্য।

Stepper-এর সবচেয়ে গুরুত্বপূর্ণ Property?
currentStep
steps
onStepContinue
onStepCancel
onStepTapped
Stepper কত ধরনের?
StepperType.vertical
StepperType.horizontal

তুমি এখন StatefulWidget জানো,
তাই একটা Registration Form Stepper Project
(Name → Email → Password → Submit)
 বানালে Stepper পুরোপুরি ক্লিয়ার হয়ে যাবে।
 */
