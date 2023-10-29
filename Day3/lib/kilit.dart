import 'package:flutter/material.dart';
import 'kasa.dart';
import 'notlar.dart';

class Kilit extends StatefulWidget {
  const Kilit({super.key});

  @override
  State<Kilit> createState() => _KilitState();
}

class _KilitState extends State<Kilit> {
  final TextEditingController _sifreController = TextEditingController();
  bool _yanlisSifre = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kilit"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              controller: _sifreController,
              decoration: InputDecoration(
                labelText: 'Şifre',
                errorText: (_yanlisSifre) ? "Yanlış Şifre" : null,
                icon: const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Icon(Icons.lock)
                )
              ),
              obscureText: true,
            ),

            const SizedBox(height: 30,),

            ElevatedButton(
              child: const Text("Gir"),
              onPressed: () {
                if (_sifreController.text == "123") {
                  _yanlisSifre = false;
                  _sifreController.text = "";
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Kasa()), // const Notlar(),
                  );
                }
                else {
                  setState(() => _yanlisSifre = true);
                }
              }, 
            )
          ],
        ),
      )
    );
  }
}