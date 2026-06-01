import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<dynamic> list = [9, 8, 7,'/', 6, 5, 4,'*', 3, 2, 1,'-', 0,  '=' ,'+',  ];
  dynamic input="0";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.topRight,
                  child: Text(input.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),)),
              Divider(thickness: 2,indent: 10,endIndent: 10,),
              SizedBox(height: 20,),
              GridView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(50, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
                    onPressed: () {
                      setState(() {
                        input += list[index];
                        // String
                       // if(list[index]=='=' && list[index]){
                       //
                       // }else if(list[index]=='+'){
                       //   input=list[index];
                       // }else if(list[index]=='-'){
                       //   input=list[index];
                       // }else if(list[index]=='*'){
                       //   input=list[index];
                       // }else if(list[index]=='/'){
                       //   input=list[index];
                       // }else{
                       //   input=list[index];
                       // }
                        
                      });
                    },
                    child: Text(
                      list[index].toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
