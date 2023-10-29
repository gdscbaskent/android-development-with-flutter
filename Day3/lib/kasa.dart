import 'package:flutter/material.dart';

class Kasa extends StatefulWidget {
  const Kasa({super.key});

  @override
  State<Kasa> createState() => _KasaState();
}

class _KasaState extends State<Kasa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kasa"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/dolar.png", width: 150),
              Image.asset("images/dolar.png", width: 150),
              Image.asset("images/dolar.png", width: 150)
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/altin.png", height: 100),
              Image.asset("images/altin.png", height: 100),
              Image.asset("images/altin.png", height: 100)
            ],
          ),

          Image.asset("images/saat.png", height: 200),
        ],
      ),
    );
  }
}