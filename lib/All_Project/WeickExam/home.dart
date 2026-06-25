import 'package:flutter/material.dart';


class HomeScreen01 extends StatefulWidget {
  const HomeScreen01({super.key});

  @override
  State<HomeScreen01> createState() => _HomeScreen01State();
}
class _HomeScreen01State extends State<HomeScreen01> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  List<String> names = [];
  List<String> numbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Hasan',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      }
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _numberController,
                    decoration: const InputDecoration(
                      hintText: '01777777777',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          names.add(_nameController.text);
                          numbers.add(_numberController.text);
                        });

                        _nameController.clear();
                        _numberController.clear();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person,color: Colors.brown[400],),
                      title: Text(names[index]),
                      titleTextStyle: TextStyle(color: Colors.red),
                      subtitle: Text(numbers[index]),
                      subtitleTextStyle: TextStyle(color: Colors.grey),
                      trailing:  Icon(Icons.call,color: Colors.blue,),
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
