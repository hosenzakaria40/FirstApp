import 'package:flutter/material.dart';
class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  bool isActive = false;
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3= false;
  bool isActive4 = false;
  bool isActive5 = false;
  bool isActive6 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Height&Wight
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive =!isActive;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width:isActive? 150: 200,
                    height: isActive? 150: 200,
                    color: Colors.blue,
                    child: Text('HeightWidth'),
                  ),
                ),
                ////color
                SizedBox(height: 20,),
                ////padding
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive1 =!isActive1;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:  200,
                    color:isActive1? Colors.blue: Colors.red,
                    child: Text('Color'),
                  ),
                ),
                ////Align
                SizedBox(height: 20,),
                Container(
                  color: Colors.black,
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isActive2 =!isActive2;
                        print(isActive2);
                      });
                    },
                    child: AnimatedContainer(duration: Duration(seconds: 1),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(isActive2? 1:30),
                      width: 200,
                      height:  200,
                      color: Colors.blue,
                      child: Text('padding'),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive3 =!isActive3;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment: isActive3? Alignment.centerRight: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:  200,
                    color:Colors.blue,
                    child: Text('Alignment'),
                  ),
                ),
                ////border radius
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive4 =!isActive4;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment:Alignment.center,
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:  200,

                    child: Text('border radius'),
                    decoration: BoxDecoration(
                      color:Colors.blue,
                      borderRadius: BorderRadius.circular(isActive4? 50: 0),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive4 =!isActive4;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment:Alignment.center,
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:  200,

                    child: Text('border radius'),
                    decoration: BoxDecoration(
                      color:Colors.blue,
                      borderRadius: BorderRadius.circular(isActive4? 50: 0),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ////border
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive5 =!isActive5;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment:Alignment.center,
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:  200,

                    child: Text('border'),
                    decoration: BoxDecoration(
                      color:Colors.blue,
                        border: isActive5? Border.all(color: Colors.red,width: 5): Border.all(color: Colors.black,width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ////border shadow.. offset and blur
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isActive6 =!isActive6;
                    });
                  },
                  child: AnimatedContainer(duration: Duration(seconds: 1),
                    alignment:Alignment.center,
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:  200,

                    child: Text('border shadow.. offset and blur'),
                    decoration: BoxDecoration(
                      color:Colors.blue,
                      // boxShadow: isActive6? [BoxShadow(blurRadius: 20)]: [BoxShadow(blurRadius: 5)],
                      boxShadow: [
                        BoxShadow(
                          color: isActive6? Colors.red: Colors.black,
                          blurRadius: isActive6? 20: 5,
                          offset: Offset(5, 6)
                        )
                        // isActive6? BoxShadow(blurRadius: 20): BoxShadow(blurRadius: 5)

                      ],
                      // shape: isActive6? BoxShape.circle: BoxShape.rectangle,
                    ),

                  ),
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
      )
      )
    );
  }
}


            /*
        Column(
        children: [
        AnimatedContainer(
        alignment: isRight
          ? Alignment.centerRight
          : Alignment.centerLeft,
          padding: EdgeInsets.all(
            isLarge ? 30 : 10,
          ),
          duration: Duration(seconds: 1),
          width: isBig ? 200 : 100,
          height: isBig ? 200 : 100,
          color: isRed ? Colors.red : Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
              isRound ? 50 : 0,
            ),
            border: Border.all(
              color: isActive ? Colors.red : Colors.black,
              width: isActive ? 5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: isGlow ? 20 : 5,
              ),
            ],
          ),
          ],
        ),*/

