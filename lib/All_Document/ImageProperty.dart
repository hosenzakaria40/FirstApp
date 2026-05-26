import 'package:flutter/material.dart';

class Imageproperty extends StatelessWidget {
  const Imageproperty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('data'),
                  SizedBox(height: 20),
                  Image.asset(
                    "asset/SC.png",
                    height: 500,
                    width: double.infinity,
                    // opacity: const AlwaysStoppedAnimation(0.6),
                    scale: 0.1,
                    filterQuality: FilterQuality.high,
                  ),

                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // image: DecorationImage(image:AssetImage('asset/SC.png'),),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          offset: Offset(4, 5),
                        ),
                      ],
                    ),
                    height: 500,
                    width: 500,
                    // color: Colors.blue,
                    child: Image.asset(
                      'asset/SC.png',
                      alignment: Alignment.topLeft,
                      height: 50,
                      width: 250,
                      // scale: 5.5,
                      colorBlendMode: BlendMode.darken,
                      fit: BoxFit.cover,
                      // color: Colors.red,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
| Type        | কাজ               |
| ----------- | ----------------- |
| `cover`     | পুরো box fill করে |
| `contain`   | পুরো image দেখায়  |
| `fill`      | stretch করে       |
| `fitWidth`  | width অনুযায়ী     |
| `fitHeight` | height অনুযায়ী    |
| `none`      | original size     |
| `scaleDown` | ছোট করে           |



------------------------------------
| Widget            | কাজ                 |
| ----------------- | ------------------- |
| `Image.asset()`   | project asset image |
| `Image.network()` | internet image      |
| `Image.file()`    | device file image   |
| `Image.memory()`  | bytes/binary image  |


সমাধান ১: clipBehavior ব্যবহার করা (সবচেয়ে সহজ)
আপনার কন্টেনারের ভেতর
clipBehavior: Clip.antiAlias প্রোপার্টিটি যোগ করে দিন।
এটি কন্টেনারের ভেতরের ইমেজটিকে কন্টেনারের বর্ডার অনুযায়ী কেটে (Clip করে) নেবে।
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: Colors.blue, // কন্টেনারের ব্যাকগ্রাউন্ড কালার
    borderRadius: BorderRadius.circular(20), // আপনার দেওয়া বর্ডার রেডিয়াস
  ),
  // এই লাইনটি যোগ করুন 👇
  clipBehavior: Clip.antiAlias,
  child: Image.asset(
    'assets/your_image.png',
    fit: BoxFit.cover,
  ),
)


সমাধান ২: DecorationImage ব্যবহার করা (সেরা উপায়)
ইমেজটিকে কন্টেনারের child হিসেবে না নিয়ে, সরাসরি কন্টেনারের BoxDecoration-এর ভেতর image প্রোপার্টি হিসেবে ব্যবহার করা।
 এতে কন্টেনারের বর্ডার রেডিয়াস স্বয়ংক্রিয়ভাবে ইমেজের ওপর প্রয়োগ হয়।

 
 */
